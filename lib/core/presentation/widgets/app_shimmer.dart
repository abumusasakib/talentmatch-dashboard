import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:talentmatch_dashboard/core/presentation/res/gen/colors.gen.dart';

class AppShimmer extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadius? borderRadius;
  final Widget? child;

  const AppShimmer({
    super.key,
    this.width = double.infinity,
    this.height = double.infinity,
    this.borderRadius,
    this.child,
  });

  const AppShimmer.rectangular({
    super.key,
    this.width = double.infinity,
    this.height = double.infinity,
    this.borderRadius,
  }) : child = null;

  const AppShimmer.circular({
    super.key,
    required double size,
    this.borderRadius = const BorderRadius.all(Radius.circular(100)),
  })  : width = size,
        height = size,
        child = null;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorName.shimmerBase,
      highlightColor: ColorName.shimmerHighlight,
      child: child ??
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: ColorName.textPrimary,
              borderRadius: borderRadius ?? BorderRadius.circular(8),
            ),
          ),
    );
  }
}
