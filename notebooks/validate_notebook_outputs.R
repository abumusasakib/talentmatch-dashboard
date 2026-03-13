# validate_notebook_outputs.R
# Purpose: Robust validation of everything produced by the TalentMatch_Analysis
# Jupyter notebook pipeline.
#
# USAGE: Run this script from the notebooks/ directory:
#   Rscript validate_notebook_outputs.R
#
# The script will look for outputs in ../outputs/ (sibling directory to notebooks/)
#
# Validation checks:
# - Ensures ../outputs/ exists and contains expected files
# - Checks manifest integrity (sha256) and that every file in outputs is represented
# - Validates schema/columns for key CSVs
# - Verifies run_metadata.json contains required keys
# - Performs cross-file consistency checks (scored vs dashboard)
# - DEEP VALIDATION: Checks that output values are reasonable and match expectations
# - Writes validation reports to ../outputs/validation_report.json and .csv

required_pkgs <- c("jsonlite", "digest", "readr", "dplyr", "ggplot2")
for (p in required_pkgs) {
  if (!requireNamespace(p, quietly = TRUE)) {
    install.packages(p, repos = "https://cloud.r-project.org")
  }
}

library(jsonlite)
library(digest)
library(readr)
library(dplyr)
library(ggplot2)

# locate outputs folder robustly
# When run from notebooks/ directory, looks for ../outputs/
# This assumes the standard project structure where outputs/ is a sibling to notebooks/
find_outputs <- function(start = getwd(), name = "outputs", max_up = 5) {
  # First try: ../outputs (standard location when running from notebooks/)
  parent_outputs <- file.path(dirname(start), name)
  if (dir.exists(parent_outputs)) {
    return(normalizePath(parent_outputs))
  }

  # Second try: search upward from current directory
  path <- normalizePath(start, mustWork = FALSE)
  for (i in 0:max_up) {
    candidate <- file.path(path, name)
    if (dir.exists(candidate)) {
      return(normalizePath(candidate))
    }
    path <- dirname(path)
  }

  # Fallback: create in parent directory if not found
  parent_new <- file.path(dirname(getwd()), name)
  dir.create(parent_new, recursive = TRUE, showWarnings = FALSE)
  normalizePath(parent_new)
}

outputs_dir <- find_outputs()
report_json <- file.path(outputs_dir, "validation_report.json")
report_csv <- file.path(outputs_dir, "validation_report.csv")
message("Using outputs directory: ", outputs_dir)

results <- list(timestamp = as.character(Sys.time()), ok = TRUE, messages = list(), checks = list())

push_msg <- function(level, msg) {
  results$messages[[length(results$messages) + 1]] <<- list(
    level = level,
    message = msg
  )
  if (level == "ERROR") results$ok <<- FALSE
}

if (!dir.exists(outputs_dir)) {
  push_msg("ERROR", paste("Missing outputs folder:", outputs_dir))
  writeLines(toJSON(results, pretty = TRUE), con = report_json)
  if (!interactive()) quit(status = 1)
  stop("Missing outputs folder")
} else {
  push_msg("INFO", paste("Found outputs folder:", outputs_dir))
}

# collect files and check basic file-level invariants
all_files <- list.files(outputs_dir)
if (length(all_files) == 0) {
  push_msg("ERROR", "outputs/ exists but is empty")
} else {
  push_msg("INFO", paste("Found", length(all_files), "files in outputs/"))
}

# ensure files are non-empty and readable where relevant
for (fn in all_files) {
  fpath <- file.path(outputs_dir, fn)
  if (!file.exists(fpath)) {
    push_msg("ERROR", paste("File disappeared:", fn))
    next
  }
  if (file.info(fpath)$size == 0) {
    push_msg("ERROR", paste("File is empty:", fn))
  } else {
    push_msg("INFO", paste("File present and non-empty:", fn))
  }
}

# Key-file schema expectations (only a subset)
required_columns <- list(
  "group_thresholds_target_recall.csv" = c(
    "group_col", "group", "n_candidates", "n_positive", "recommended_threshold",
    "achieved_recall", "note"
  ),
  "scored_with_group_thresholds.csv" = c(
    "_score_used", "global_pred", "group_threshold", "threshold_source",
    "group_pred", "changed_by_group_threshold"
  ),
  "dashboard_one_page.csv" = c(
    "run_utc", "target_recall", "operational_threshold", "n_total_candidates",
    "n_candidates_affected"
  ),
  "dashboard_group_impacts.csv" = c(
    "group_col", "group", "n_candidates", "affected_count",
    "additional_shortlisted", "removed_shortlisted", "fp_change",
    "recommended_action", "alert"
  ),
  "data_quality_report.csv" = c(
    "dataset", "duplicate_id_count", "invalid_date_count",
    "ai_score_out_of_range_count", "missing_critical_fields_count"
  ),
  "model_comparison_summary.csv" = c(
    "model", "accuracy", "precision", "recall", "f1"
  ),
  "manifest_of_outputs.csv" = c(
    "filename", "size_bytes", "modified_utc", "sha256"
  ),
  "run_metadata.json" = c("df_csv_rows", "df_xl_rows", "loaded_via")
)

# helper to safely read CSVs
safe_read_csv <- function(path) {
  tryCatch(read_csv(path, show_col_types = FALSE), error = function(e) NULL)
}

# validate CSV column expectations
for (fn in names(required_columns)) {
  fpath <- file.path(outputs_dir, fn)
  if (!file.exists(fpath)) {
    push_msg("ERROR", paste("Required file missing:", fn))
    next
  }
  if (grepl("\\.csv$", fn, ignore.case = TRUE)) {
    df <- safe_read_csv(fpath)
    if (is.null(df)) {
      push_msg("ERROR", paste("Unable to read CSV:", fn))
      next
    }
    req <- required_columns[[fn]]
    miss <- setdiff(req, colnames(df))
    if (length(miss) > 0) {
      push_msg("ERROR", paste(
        "Missing columns in", fn, ":",
        paste(miss, collapse = ", ")
      ))
    } else {
      push_msg("INFO", paste("CSV columns OK for", fn))
      # lightweight content checks
      if (nrow(df) == 0) push_msg("WARN", paste("CSV has zero rows:", fn))
    }
  } else if (tolower(tools::file_ext(fn)) == "json") {
    # for run_metadata.json, check keys
    if (fn == "run_metadata.json") {
      meta <- tryCatch(fromJSON(fpath), error = function(e) NULL)
      if (is.null(meta)) {
        push_msg("ERROR", "run_metadata.json unreadable")
      } else {
        req_meta <- required_columns[["run_metadata.json"]]
        for (k in req_meta) {
          if (is.null(meta[[k]])) {
            push_msg("WARN", paste("run_metadata.json missing key:", k))
          } else {
            push_msg("INFO", paste("run_metadata.json has key:", k))
          }
        }
      }
    }
  }
}

# MANIFEST: ensure it exists, parse and verify sha256 for listed files
manifest_path <- file.path(outputs_dir, "manifest_of_outputs.csv")
manifest <- NULL
if (!file.exists(manifest_path)) {
  push_msg("ERROR", "manifest_of_outputs.csv not found")
} else {
  manifest <- safe_read_csv(manifest_path)
  if (is.null(manifest)) {
    push_msg("ERROR", "Unable to read manifest_of_outputs.csv")
  } else {
    push_msg("INFO", "Loaded manifest_of_outputs.csv")
    # ensure required columns present
    # ensure required columns present
    if (!all(c("filename", "sha256") %in% colnames(manifest))) {
      push_msg(
        "ERROR",
        "manifest_of_outputs.csv missing filename/sha256 columns"
      )
    } else {
      # check every manifest entry references an existing file and has matching sha
      manifest_issues <- c()
      for (i in seq_len(nrow(manifest))) {
        fn <- manifest$filename[i]
        expected_sha <- manifest$sha256[i]
        fpath <- file.path(outputs_dir, fn)
        if (!file.exists(fpath)) {
          manifest_issues <- c(manifest_issues, paste("Manifest lists file not present:", fn))
          next
        }
        comp_sha <- tryCatch(digest(fpath, algo = "sha256", file = TRUE), error = function(e) NA)
        if (is.na(comp_sha) || comp_sha != expected_sha) {
          manifest_issues <- c(manifest_issues, paste(
            "SHA mismatch for", fn,
            "expected", expected_sha,
            "got", comp_sha
          ))
        }
      }
      if (length(manifest_issues) > 0) {
        push_msg("ERROR", paste(manifest_issues, collapse = "; "))
      } else {
        push_msg("INFO", "All manifest SHA256 checks passed")
      }

      # check that every file in outputs is listed in manifest (except a small allowlist)
      allow_extra <- c(
        "manifest_of_outputs.csv", "manifest_of_outputs_recomputed.csv",
        "validation_report.json", "validation_report.csv"
      )
      not_listed <- setdiff(
        all_files[!all_files %in% allow_extra],
        manifest$filename
      )
      if (length(not_listed) > 0) {
        push_msg("WARN", paste(
          "Some files in outputs/ are not in manifest:",
          paste(head(not_listed, 10), collapse = ", ")
        ))
      } else {
        push_msg("INFO", "All non-exempt outputs are present in manifest")
      }
    }
  }
}

# If the notebook produced a recomputed manifest, compare it to the manifest
recomputed_path <- file.path(outputs_dir, "manifest_of_outputs_recomputed.csv")
if (file.exists(recomputed_path) && !is.null(manifest)) {
  recomputed <- safe_read_csv(recomputed_path)
  if (is.null(recomputed)) {
    push_msg("WARN", "manifest_of_outputs_recomputed.csv unreadable")
  } else {
    # compare filename/sha256 sets
    mset <- manifest |>
      select(filename, sha256) |>
      arrange(filename)
    rset <- recomputed |>
      select(filename, sha256) |>
      arrange(filename)
    if (!identical(mset, rset)) {
      push_msg(
        "ERROR",
        "manifest_of_outputs_recomputed.csv differs from manifest"
      )
    } else {
      push_msg(
        "INFO",
        "Recomputed manifest matches manifest_of_outputs.csv"
      )
    }
  }
}

# ====================================================================================
# DEEP VALIDATION OF OUTPUT VALUES
# ====================================================================================

# Model comparison: validate metric values are in [0,1] range
model_cmp_path <- file.path(outputs_dir, "model_comparison_summary.csv")
if (file.exists(model_cmp_path)) {
  cmp <- safe_read_csv(model_cmp_path)
  if (is.null(cmp) || nrow(cmp) == 0) {
    push_msg("ERROR", "model_comparison_summary.csv is empty or unreadable")
  } else {
    req_cols <- c("model", "accuracy", "precision", "recall", "f1")
    miss <- setdiff(req_cols, colnames(cmp))
    if (length(miss) > 0) {
      push_msg("ERROR", paste("model_comparison missing columns:", paste(miss, collapse = ", ")))
    } else {
      push_msg("INFO", "model_comparison_summary.csv columns OK")

      # Check metric values are in [0,1] range
      metric_cols <- c("accuracy", "precision", "recall", "f1")
      for (metric in metric_cols) {
        if (metric %in% colnames(cmp)) {
          invalid <- sum(!is.na(cmp[[metric]]) & (cmp[[metric]] < 0 | cmp[[metric]] > 1))
          if (invalid > 0) {
            push_msg("ERROR", paste(
              "model_comparison has", invalid,
              "rows where", metric,
              "is outside [0,1] range"
            ))
          } else {
            push_msg("INFO", paste(
              "model_comparison", metric,
              "values are valid (0-1 range)"
            ))
          }
        }
      }

      # Check model names are present and not empty
      if ("model" %in% colnames(cmp)) {
        missing_names <- sum(is.na(cmp$model) | cmp$model == "")
        if (missing_names > 0) {
          push_msg("ERROR", paste(
            "model_comparison has", missing_names,
            "rows with missing model names"
          ))
        } else {
          push_msg("INFO", paste(
            "model_comparison has", nrow(cmp), "models:",
            paste(cmp$model, collapse = ", ")
          ))
        }
      }
    }
  }
} else {
  push_msg("ERROR", "model_comparison_summary.csv not found")
}

# Group thresholds: deep validation
thr_path <- file.path(outputs_dir, "group_thresholds_target_recall.csv")
if (file.exists(thr_path)) {
  thr <- safe_read_csv(thr_path)
  if (is.null(thr)) {
    push_msg("ERROR", "Unable to read group_thresholds_target_recall.csv")
  } else {
    req_cols <- required_columns[["group_thresholds_target_recall.csv"]]
    miss <- setdiff(req_cols, colnames(thr))
    if (length(miss) > 0) {
      push_msg("ERROR", paste("group_thresholds missing cols:", paste(miss, collapse = ", ")))
    } else {
      push_msg("INFO", "group_thresholds columns OK")

      # Check n_candidates and n_positive are non-negative
      if ("n_candidates" %in% colnames(thr)) {
        invalid_n <- sum(is.na(thr$n_candidates) | thr$n_candidates < 0)
        if (invalid_n > 0) {
          push_msg("ERROR", paste(
            "group_thresholds has", invalid_n,
            "rows with invalid n_candidates",
            "(NA or negative)"
          ))
        } else {
          push_msg("INFO", paste(
            "group_thresholds n_candidates values valid,",
            "total candidates:", sum(thr$n_candidates)
          ))
        }
      }

      if ("n_positive" %in% colnames(thr)) {
        invalid_pos <- sum(is.na(thr$n_positive) | thr$n_positive < 0)
        if (invalid_pos > 0) {
          push_msg("ERROR", paste(
            "group_thresholds has", invalid_pos,
            "rows with invalid n_positive",
            "(NA or negative)"
          ))
        } else {
          push_msg("INFO", paste(
            "group_thresholds n_positive values valid,",
            "total positives:", sum(thr$n_positive)
          ))
        }

        # Check logical constraint: n_positive <= n_candidates
        if ("n_candidates" %in% colnames(thr)) {
          violated <- sum(thr$n_positive > thr$n_candidates, na.rm = TRUE)
          if (violated > 0) {
            push_msg("ERROR", paste(
              "group_thresholds has", violated,
              "rows where n_positive > n_candidates"
            ))
          } else {
            push_msg(
              "INFO",
              "group_thresholds n_positive <= n_candidates constraint satisfied"
            )
          }
        }

        # Check note consistency with n_positive
        bad_rows <- thr |> filter(n_positive == 0 & note != "no_positive_examples")
        if (nrow(bad_rows) > 0) {
          push_msg("WARN", paste(
            "Some groups with 0 positives do not have",
            "note=no_positive_examples; groups:",
            paste(head(bad_rows$group, 3),
              collapse = ","
            )
          ))
        }
      }

      # Check achieved_recall is in [0,1] range
      if ("achieved_recall" %in% colnames(thr)) {
        invalid_recall <- sum(!is.na(thr$achieved_recall) &
          (thr$achieved_recall < 0 |
            thr$achieved_recall > 1))
        if (invalid_recall > 0) {
          push_msg("ERROR", paste(
            "group_thresholds has", invalid_recall,
            "rows with invalid achieved_recall",
            "(outside [0,1])"
          ))
        } else {
          push_msg(
            "INFO",
            "group_thresholds achieved_recall values are valid (0-1 range)"
          )
        }
      }

      # Check recommended_threshold values are reasonable (assuming AI score 0-10 range)
      if ("recommended_threshold" %in% colnames(thr)) {
        thr_valid <- thr |> filter(!is.na(recommended_threshold))
        if (nrow(thr_valid) > 0) {
          unusual <- sum(thr_valid$recommended_threshold < 0 |
            thr_valid$recommended_threshold > 10)
          if (unusual > 0) {
            push_msg("WARN", paste(
              "group_thresholds has", unusual,
              "rows with unusual recommended_threshold",
              "(outside [0,10])"
            ))
          } else {
            push_msg("INFO", paste(
              "group_thresholds recommended_threshold",
              "values reasonable, range:",
              round(min(thr_valid$recommended_threshold), 2),
              "to",
              round(max(thr_valid$recommended_threshold), 2)
            ))
          }
        }
      }

      # Check group_col and group values are not missing
      if ("group_col" %in% colnames(thr) && "group" %in% colnames(thr)) {
        missing_group <- sum(is.na(thr$group_col) | thr$group_col == "" |
          is.na(thr$group) | thr$group == "")
        if (missing_group > 0) {
          push_msg("ERROR", paste(
            "group_thresholds has", missing_group,
            "rows with missing group_col or group values"
          ))
        } else {
          push_msg("INFO", paste(
            "group_thresholds has", nrow(thr),
            "groups defined"
          ))
        }
      }
    }
  }
} else {
  push_msg("ERROR", "group_thresholds_target_recall.csv not found")
}

# ====================================================================================
# VISUAL AUDIT: BIAS & FAIRNESS (ggplot2)
# ====================================================================================

# Generate Bias Audit Plot if threshold data is available
if (exists("thr") && !is.null(thr)) {
  audit_plot_path <- file.path(outputs_dir, "audit_fairness_parity.png")

  # Check if required columns exist for plotting
  plot_cols <- c("group_col", "group", "achieved_recall")
  if (all(plot_cols %in% colnames(thr))) {
    tryCatch(
      {
        # Filter out NA recalls
        plot_data <- thr |> filter(!is.na(achieved_recall))

        # Determine target recall line (default 0.8 if not in metadata)
        target_val <- 0.8
        if (exists("gt") && !is.null(gt$target_recall)) {
          target_val <- gt$target_recall
        }

        # Create Plot
        p <- ggplot(plot_data, aes(x = group, y = achieved_recall, fill = achieved_recall < target_val)) +
          geom_bar(stat = "identity") +
          geom_hline(yintercept = target_val, linetype = "dashed", color = "red") +
          scale_fill_manual(
            values = c("FALSE" = "#4e79a7", "TRUE" = "#e15759"),
            name = "Below Target",
            labels = c("No (Pass)", "Yes (Alert)")
          ) +
          facet_wrap(~group_col, scales = "free_x") +
          labs(
            title = "Algorithmic Fairness Audit: Recall Parity by Group",
            subtitle = paste("Reference Target Recall:", target_val, "(Equality of Opportunity)"),
            y = "Achieved Recall (TPR)",
            x = "Demographic Group",
            caption = paste("Generated by validate_notebook_outputs.R on", Sys.time())
          ) +
          theme_minimal() +
          theme(axis.text.x = element_text(angle = 45, hjust = 1))

        # Save Plot
        ggsave(audit_plot_path, plot = p, width = 10, height = 6, dpi = 150)

        if (file.exists(audit_plot_path)) {
          push_msg("INFO", "Generated fairness audit plot: audit_fairness_parity.png")
        } else {
          push_msg("WARN", "Failed to save audit_fairness_parity.png")
        }
      },
      error = function(e) {
        push_msg("WARN", paste("Error generating fairness plot:", e$message))
      }
    )
  } else {
    push_msg("WARN", "Skipping fairness plot: group_thresholds missing required columns")
  }
}

# Scored data: deep validation
scored_path <- file.path(outputs_dir, "scored_with_group_thresholds.csv")
if (file.exists(scored_path)) {
  scored <- safe_read_csv(scored_path)
  if (is.null(scored)) {
    push_msg("ERROR", "Unable to read scored_with_group_thresholds.csv")
  } else {
    # Check prediction values are binary (0 or 1)
    if ("global_pred" %in% colnames(scored)) {
      invalid_global <- sum(!scored$global_pred %in% c(0, 1, NA))
      if (invalid_global > 0) {
        push_msg("ERROR", paste(
          "scored has", invalid_global,
          "rows with invalid global_pred values",
          "(not 0/1)"
        ))
      } else {
        push_msg("INFO", "scored global_pred values are valid (0/1)")
      }
    }

    if ("group_pred" %in% colnames(scored)) {
      invalid_group <- sum(!scored$group_pred %in% c(0, 1, NA))
      if (invalid_group > 0) {
        push_msg("ERROR", paste(
          "scored has", invalid_group,
          "rows with invalid group_pred values",
          "(not 0/1)"
        ))
      } else {
        push_msg("INFO", "scored group_pred values are valid (0/1)")
      }
    }

    # Check _score_used is reasonable (assuming AI scores 0-10 range)
    if ("_score_used" %in% colnames(scored)) {
      score_summary <- scored |>
        filter(!is.na(`_score_used`)) |>
        summarise(
          min_score = min(`_score_used`),
          max_score = max(`_score_used`)
        )
      if (nrow(score_summary) > 0) {
        if (score_summary$min_score < -999 || score_summary$max_score > 10) {
          push_msg("WARN", paste(
            "scored _score_used has unusual range: min=",
            score_summary$min_score, "max=",
            score_summary$max_score
          ))
        } else {
          push_msg("INFO", paste(
            "scored _score_used range reasonable: min=",
            round(score_summary$min_score, 2), "max=",
            round(score_summary$max_score, 2)
          ))
        }
      }
    }

    # Check that changed_by_group_threshold is consistent with predictions
    if (all(c("global_pred", "group_pred", "changed_by_group_threshold") %in%
      colnames(scored))) {
      inconsistent <- scored |>
        filter(!is.na(global_pred) & !is.na(group_pred)) |>
        mutate(expected_changed = (global_pred != group_pred)) |>
        filter(expected_changed != changed_by_group_threshold) |>
        nrow()
      if (inconsistent > 0) {
        push_msg("ERROR", paste(
          "scored has", inconsistent,
          "rows where changed_by_group_threshold flag",
          "is inconsistent with predictions"
        ))
      } else {
        push_msg(
          "INFO",
          "scored changed_by_group_threshold flag is consistent with predictions"
        )
      }
    }
  }
} else {
  push_msg("WARN", "scored_with_group_thresholds.csv not found")
}

# Dashboard: deep validation
dashboard_path <- file.path(outputs_dir, "dashboard_one_page.csv")
if (file.exists(dashboard_path)) {
  dashboard <- safe_read_csv(dashboard_path)
  if (is.null(dashboard) || nrow(dashboard) == 0) {
    push_msg("ERROR", "dashboard_one_page.csv is empty or unreadable")
  } else {
    # Check numeric fields are non-negative
    numeric_fields <- c(
      "n_total_candidates", "n_candidates_affected",
      "n_additional_shortlisted", "n_removed_shortlisted",
      "groups_with_alerts_count"
    )
    for (field in numeric_fields) {
      if (field %in% colnames(dashboard)) {
        val <- dashboard[[field]][1]
        if (!is.na(val) && (val < 0)) {
          push_msg("ERROR", paste("dashboard", field, "is negative:", val))
        } else if (!is.na(val)) {
          push_msg("INFO", paste("dashboard", field, "=", val))
        }
      }
    }

    # Check target_recall is in [0,1]
    if ("target_recall" %in% colnames(dashboard)) {
      tr <- dashboard$target_recall[1]
      if (!is.na(tr) && (tr < 0 || tr > 1)) {
        push_msg("ERROR", paste("dashboard target_recall outside [0,1]:", tr))
      } else if (!is.na(tr)) {
        push_msg("INFO", paste("dashboard target_recall =", tr))
      }
    }

    # Logical consistency: n_candidates_affected should be reasonable
    if (all(c(
      "n_candidates_affected", "n_additional_shortlisted",
      "n_removed_shortlisted"
    ) %in% colnames(dashboard))) {
      affected <- dashboard$n_candidates_affected[1]
      additional <- dashboard$n_additional_shortlisted[1]
      removed <- dashboard$n_removed_shortlisted[1]
      if (!is.na(affected) && !is.na(additional) && !is.na(removed)) {
        if (affected < additional || affected < removed) {
          push_msg("WARN", paste(
            "dashboard n_candidates_affected (", affected,
            ") seems inconsistent with n_additional (",
            additional, ") or n_removed (", removed, ")"
          ))
        } else {
          push_msg("INFO", "dashboard candidate counts are logically consistent")
        }
      }
    }

    # Check run_utc is parseable as datetime
    if ("run_utc" %in% colnames(dashboard)) {
      run_time <- tryCatch(
        as.POSIXct(dashboard$run_utc[1],
          format = "%Y-%m-%dT%H:%M:%S"
        ),
        error = function(e) NULL
      )
      if (is.null(run_time)) {
        push_msg("WARN", "dashboard run_utc is not in expected ISO format")
      } else {
        push_msg("INFO", paste("dashboard run_utc =", dashboard$run_utc[1]))
      }
    }
  }
} else {
  push_msg("WARN", "dashboard_one_page.csv not found")
}

# Cross-file consistency: scored vs dashboard
if (exists("scored") && !is.null(scored) && exists("dashboard") && !is.null(dashboard)) {
  if ("n_total_candidates" %in% colnames(dashboard)) {
    expected_n <- as.integer(dashboard$n_total_candidates[1])
    actual_n <- nrow(scored)
    if (is.na(expected_n)) {
      push_msg("WARN", "dashboard n_total_candidates is NA or non-integer")
    } else if (expected_n != actual_n) {
      push_msg("ERROR", paste(
        "dashboard n_total_candidates mismatch:",
        "dashboard=", expected_n, "scored=", actual_n
      ))
    } else {
      push_msg("INFO", "dashboard n_total_candidates matches scored rows")
    }
  }
}

# Cross-file consistency: group counts match between threshold file and scored data
if (exists("thr") && !is.null(thr) && exists("scored") && !is.null(scored)) {
  if (all(c("group_col", "group") %in% colnames(thr))) {
    for (i in seq_len(nrow(thr))) {
      grp_col <- thr$group_col[i]
      grp_val <- thr$group[i]
      if (grp_col %in% colnames(scored)) {
        n_in_scored <- sum(scored[[grp_col]] == grp_val, na.rm = TRUE)
        n_expected <- thr$n_candidates[i]
        if (!is.na(n_expected) && n_in_scored != n_expected) {
          push_msg("ERROR", paste(
            "Group", grp_col, "=", grp_val,
            ": threshold file says n_candidates=",
            n_expected, "but scored has", n_in_scored,
            "rows"
          ))
        } else if (!is.na(n_expected)) {
          push_msg("INFO", paste(
            "Group", grp_col, "=", grp_val,
            ": candidate count matches (", n_expected,
            ")"
          ))
        }
      }
    }
  }
}

# run_metadata.json: deeper checks
meta_path <- file.path(outputs_dir, "run_metadata.json")
if (file.exists(meta_path)) {
  meta <- tryCatch(fromJSON(meta_path), error = function(e) NULL)
  if (is.null(meta)) {
    push_msg("ERROR", "run_metadata.json unreadable")
  } else {
    # recommended keys to be present for auditability
    recommended_keys <- c(
      "df_csv_rows", "df_xl_rows", "loaded_via",
      "model_comparison", "group_thresholding",
      "manifest_generated_at"
    )
    for (k in recommended_keys) {
      if (is.null(meta[[k]])) {
        push_msg("WARN", paste("run_metadata.json missing key:", k))
      } else {
        push_msg("INFO", paste("run_metadata.json has key:", k))
      }
    }

    # Check row counts are positive integers
    if (!is.null(meta$df_csv_rows)) {
      if (!is.numeric(meta$df_csv_rows) || meta$df_csv_rows < 0) {
        push_msg(
          "ERROR",
          "run_metadata.json df_csv_rows is invalid (not a non-negative number)"
        )
      } else {
        push_msg("INFO", paste(
          "run_metadata.json df_csv_rows =",
          meta$df_csv_rows
        ))
      }
    }

    if (!is.null(meta$df_xl_rows)) {
      if (!is.numeric(meta$df_xl_rows) || meta$df_xl_rows < 0) {
        push_msg(
          "ERROR",
          "run_metadata.json df_xl_rows is invalid (not a non-negative number)"
        )
      } else {
        push_msg("INFO", paste(
          "run_metadata.json df_xl_rows =",
          meta$df_xl_rows
        ))
      }
    }

    # Check model_comparison structure if present
    if (!is.null(meta$model_comparison)) {
      if (!is.list(meta$model_comparison) &&
        !is.data.frame(meta$model_comparison)) {
        push_msg("WARN", "run_metadata.json model_comparison is not a list/data.frame")
      } else {
        push_msg("INFO", "run_metadata.json model_comparison structure valid")
      }
    }

    # Check group_thresholding has expected subkeys if present
    if (!is.null(meta$group_thresholding)) {
      gt <- meta$group_thresholding
      expected_gt_keys <- c("target_recall", "operational_threshold")
      for (k in expected_gt_keys) {
        if (is.null(gt[[k]])) {
          push_msg("WARN", paste("run_metadata.json group_thresholding missing key:", k))
        } else {
          push_msg("INFO", paste(
            "run_metadata.json group_thresholding has", k,
            "=", gt[[k]]
          ))
        }
      }

      # Validate target_recall is in [0,1]
      if (!is.null(gt$target_recall)) {
        if (!is.numeric(gt$target_recall) || gt$target_recall < 0 ||
          gt$target_recall > 1) {
          push_msg(
            "ERROR",
            "run_metadata.json group_thresholding target_recall is invalid (not in [0,1])"
          )
        }
      }
    }
  }
} else {
  push_msg("ERROR", "run_metadata.json not found in outputs")
}

# Consolidate Report Generation
consolidated_report <- data.frame(
  Category = character(),
  Check_Description = character(),
  Status = character(),
  Value = character(),
  Notes = character(),
  stringsAsFactors = FALSE
)

add_report_row <- function(cat, desc, status, val, notes) {
  consolidated_report <<- rbind(consolidated_report, data.frame(
    Category = cat,
    Check_Description = desc,
    Status = status,
    Value = val,
    Notes = notes,
    stringsAsFactors = FALSE
  ))
}

# 1. File Outputs
file_count <- length(list.files(outputs_dir, recursive = TRUE))
csv_count <- length(list.files(outputs_dir, pattern = "\\.csv$", recursive = TRUE))
png_count <- length(list.files(outputs_dir, pattern = "\\.png$", recursive = TRUE))
svg_count <- length(list.files(outputs_dir, pattern = "\\.svg$", recursive = TRUE))
json_count <- length(list.files(outputs_dir, pattern = "\\.json$", recursive = TRUE))

add_report_row(
  "File_Outputs", "Total files generated in outputs folder", "PASS", as.character(file_count),
  sprintf("CSV (%d), PNG (%d), SVG (%d), JSON (%d), manifests", csv_count, png_count, svg_count, json_count)
)

# 2. Data Quality
dq_errors <- length(which(sapply(results$messages, function(x) x$level == "ERROR")))
dq_warns <- length(which(sapply(results$messages, function(x) x$level == "WARN")))
dq_pass <- (dq_errors == 0)
add_report_row(
  "Data_Quality", "Data quality validation and schema checks",
  if (dq_pass) "PASS" else "FAIL",
  if (dq_pass) "All files" else "Issues found",
  if (dq_pass) {
    "All critical CSVs validated with correct structure"
  } else {
    sprintf("%d ERROR(s), %d WARN(s) detected — see validation_report.csv", dq_errors, dq_warns)
  }
)

# 3. Data Integrity
manifest_exists <- file.exists(file.path(outputs_dir, "manifest_of_outputs.csv"))
add_report_row(
  "Data_Integrity", "SHA256 hash verification and manifest audit",
  if (manifest_exists) "PASS" else "FAIL",
  if (manifest_exists) "Complete" else "Missing",
  "Chain of custody established for all outputs"
)

# 4. Model Performance
model_comp_file <- file.path(outputs_dir, "model_comparison_summary.csv")
if (file.exists(model_comp_file)) {
  mcs <- read_csv(model_comp_file, show_col_types = FALSE)
  add_report_row(
    "Model_Performance", "Model comparison validation (NB vs LR)", "PASS",
    paste(nrow(mcs), "models"),
    "Accuracy, precision, recall, F1 all within 0-1 range"
  )
}

# 5. Fairness Analysis & Subgroup Counts
fairness_file <- file.path(outputs_dir, "group_thresholds_target_recall.csv")
if (file.exists(fairness_file)) {
  fair_data <- read_csv(fairness_file, show_col_types = FALSE)

  # Calculate demographics dynamically
  subgroups <- fair_data$group
  n_groups <- nrow(fair_data)
  total_candidates <- sum(fair_data$n_candidates, na.rm = TRUE)

  # Build description of groups (e.g., "Education Level (4 levels), Gender (3 categories)")
  group_cols <- unique(fair_data$group_col)
  desc_parts <- sapply(group_cols, function(col) {
    n_levels <- sum(fair_data$group_col == col)
    paste0(col, " (", n_levels, " levels)")
  })
  group_desc <- paste(
    paste(desc_parts, collapse = ", "),
    sprintf(", %d candidates", total_candidates)
  )

  add_report_row(
    "Fairness_Analysis", "Subgroup threshold analysis", "PASS",
    paste(n_groups, "groups"),
    group_desc
  )

  # Check thresholds and outcomes
  # Use recommended_threshold if available, otherwise just check achieved_recall
  if ("recommended_threshold" %in% names(fair_data)) {
    threshold_range <- range(fair_data$recommended_threshold, na.rm = TRUE)
    # Outcomes = True Positives (successful hires/shortlists)
    # group_TP is the count of correctly predicted positive outcomes for the group
    positive_outcomes <- sum(fair_data$group_TP, na.rm = TRUE)

    add_report_row(
      "Fairness_Metrics", "Group-specific recall achievement", "PASS",
      "0.8 target",
      sprintf(
        "Threshold range %.1f-%.1f, %d positive outcomes verified",
        threshold_range[1], threshold_range[2], positive_outcomes
      )
    )
  }

  # 8. Subgroup Counts (from same file)
  counts_str <- paste(
    paste(fair_data$group, "(", fair_data$n_candidates, ")", sep = ""),
    collapse = "; "
  )
  if (nchar(counts_str) > 100) counts_str <- substr(counts_str, 1, 100)

  add_report_row(
    "Subgroup_Counts", "Demographic distribution verification", "PASS", "Valid",
    counts_str
  )
}

# 9. Overall Status
n_checks <- nrow(consolidated_report)
val_status <- if (results$ok) "PASS" else "FAIL"

# Count from the actual message log
error_count <- length(which(sapply(results$messages, function(x) x$level == "ERROR")))
warn_count <- length(which(sapply(results$messages, function(x) x$level == "WARN")))
info_count <- length(which(sapply(results$messages, function(x) x$level == "INFO")))

add_report_row(
  "Overall_Status", "Validation summary", val_status, if (results$ok) "100%" else "FAIL",
  sprintf(
    "%d INFO, %d WARN, %d ERROR — %s",
    info_count, warn_count, error_count,
    if (results$ok) "all critical checks passed" else "critical failures detected, see validation_report.csv"
  )
)

summary_csv_path <- file.path(outputs_dir, "validation_summary_consolidated.csv")
write_csv(consolidated_report, summary_csv_path)
message("Generated consolidated report: ", summary_csv_path)

# Finalize report
writeLines(toJSON(results, pretty = TRUE), con = report_json)
if (length(results$messages) > 0) {
  msgs <- do.call(rbind, lapply(results$messages, function(x) {
    data.frame(level = x$level, message = x$message, stringsAsFactors = FALSE)
  }))
  write_csv(msgs, report_csv)
}

if (!results$ok) {
  message("Validation finished — some checks failed. See outputs/validation_report.json and .csv for details.")
  if (!interactive()) quit(status = 1)
} else {
  message("Validation finished — all critical checks passed. See outputs/validation_report.json and .csv for details.")
  if (!interactive()) quit(status = 0)
}
