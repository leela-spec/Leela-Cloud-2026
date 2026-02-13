import 'package:flutter/material.dart';
import 'package:nowa_runtime/nowa_runtime.dart';

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
      painter: _NeonGradientPainter(
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

@NowaGenerated()
class _NeonGradientPainter extends CustomPainter {
  _NeonGradientPainter({
    required this.gradient,
    required this.borderRadius,
    required this.strokeWidth,
  });

  final Gradient gradient;

  final double borderRadius;

  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromLTWH(0.0, 0.0, size.width, size.height);
    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    final RRect rrect = RRect.fromRectAndRadius(
      rect,
      Radius.circular(borderRadius),
    );
    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(_NeonGradientPainter oldDelegate) {
    return oldDelegate.gradient != gradient ||
        oldDelegate.borderRadius != borderRadius ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
