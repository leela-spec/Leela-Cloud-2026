import 'package:flutter/material.dart';
import 'package:nowa_runtime/nowa_runtime.dart';
import 'package:leela_cloud_2026/neon_gradient_painter.dart';

@NowaGenerated()
class NeonGradientBorder extends StatelessWidget {
  @NowaGenerated({'loader': 'auto-constructor'})
  const NeonGradientBorder({
    required this.child,
    this.borderRadius = 12.0,
    this.strokeWidth = 1.5,
    super.key,
  });

  final Widget child;

  final double borderRadius;

  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: NeonGradientPainter(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.secondary,
          ],
        ),
        borderRadius: borderRadius,
        strokeWidth: strokeWidth,
      ),
      child: child,
    );
  }
}
