import 'package:flutter/material.dart';
import 'package:nowa_runtime/nowa_runtime.dart';
import 'package:leela_cloud_2026/neon_donut_painter.dart';

@NowaGenerated()
class LeelaNeonMetricDonut extends StatelessWidget {
  @NowaGenerated({'loader': 'auto-constructor'})
  const LeelaNeonMetricDonut({
    required this.label,
    required this.realized,
    required this.timeTarget,
    required this.target,
    required this.size,
    required this.strokeWidth,
    required this.enablePulse,
    this.onTap,
    super.key,
  });

  final String label;

  final double realized;

  final double timeTarget;

  final double target;

  final double size;

  final double strokeWidth;

  final bool enablePulse;

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: size,
        height: size,
        child: CustomPaint(
          painter: NeonDonutPainter(
            cs: cs,
            label: label,
            realized: realized,
            timeTarget: timeTarget,
            target: target,
            strokeWidth: strokeWidth,
            pulse: 0.0,
          ),
        ),
      ),
    );
  }
}
