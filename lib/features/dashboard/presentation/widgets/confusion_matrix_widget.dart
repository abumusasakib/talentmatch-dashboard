import 'package:flutter/material.dart';
import 'package:talentmatch_dashboard/core/presentation/res/gen/colors.gen.dart';
import 'package:talentmatch_dashboard/features/dashboard/domain/entity/performance_metrics_entities.dart';

class ConfusionMatrixWidget extends StatelessWidget {
  final ConfusionMatrixEntity matrix;

  const ConfusionMatrixWidget({
    super.key,
    required this.matrix,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorName.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ColorName.surfaceVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Model Diagnostics (Confusion Matrix)',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: ColorName.textPrimary,
                    ),
              ),
              _MetricBadge(
                label: 'Accuracy',
                value: '${(matrix.accuracy * 100).toStringAsFixed(1)}%',
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Row(
              children: [
                // Labels Column
                const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _Label(text: 'Actual Pos'),
                    _Label(text: 'Actual Neg'),
                  ],
                ),
                const SizedBox(width: 8),
                // Matrix Grid
                Expanded(
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _Label(text: 'Pred Neg'),
                          _Label(text: 'Pred Pos'),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                        child: Row(
                          children: [
                            _Cell(
                              value: matrix.trueNegative,
                              label: 'True Negative',
                              color: Colors.blue.withOpacity(0.2),
                              textColor: Colors.blue[300]!,
                            ),
                            const SizedBox(width: 8),
                            _Cell(
                              value: matrix.falsePositive,
                              label: 'False Positive',
                              color: ColorName.error.withOpacity(0.1),
                              textColor: ColorName.error,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                        child: Row(
                          children: [
                            _Cell(
                              value: matrix.falseNegative,
                              label: 'False Negative',
                              color: ColorName.warning.withOpacity(0.1),
                              textColor: ColorName.warning,
                            ),
                            const SizedBox(width: 8),
                            _Cell(
                              value: matrix.truePositive,
                              label: 'True Positive',
                              color: ColorName.success.withOpacity(0.2),
                              textColor: ColorName.success,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Label extends StatelessWidget {
  final String text;
  const _Label({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 10,
        color: ColorName.textSecondary,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _Cell extends StatelessWidget {
  final int value;
  final String label;
  final Color color;
  final Color textColor;

  const _Cell({
    required this.value,
    required this.label,
    required this.color,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              value.toString(),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 9,
                color: textColor.withOpacity(0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MetricBadge extends StatelessWidget {
  final String label;
  final String value;

  const _MetricBadge({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: ColorName.surfaceVariant,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$label: ',
            style: TextStyle(fontSize: 10, color: ColorName.textSecondary),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: ColorName.primary,
            ),
          ),
        ],
      ),
    );
  }
}
