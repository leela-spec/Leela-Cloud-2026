import 'package:flutter/material.dart';
import 'package:nowa_runtime/nowa_runtime.dart';
import 'dart:math';

@NowaGenerated()
class LeelaDonutPainter extends CustomPainter {
  LeelaDonutPainter({
    required this.realized,
    required this.timeTarget,
    required this.target,
    required this.thickness,
    required this.primary,
    required this.track,
    required this.success,
    required this.deficit,
    required this.dotCenter,
    required this.dotRing,
    required this.showDot,
    required this.showDeficitStripe,
    required this.glow,
  });

  final double realized;

  final double timeTarget;

  final double target;

  final double thickness;

  final Color primary;

  final Color track;

  final Color success;

  final Color deficit;

  final Color dotCenter;

  final Color dotRing;

  final bool showDot;

  final bool showDeficitStripe;

  final double glow;

  @override
  bool shouldRepaint(LeelaDonutPainter oldDelegate) {
    return oldDelegate.realized != realized ||
        oldDelegate.timeTarget != timeTarget ||
        oldDelegate.target != target ||
        oldDelegate.glow != glow;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (min(size.width, size.height) - this.thickness) / 2;
    final rect = Rect.fromCircle(center: center, radius: radius);
    final Paint trackPaint = Paint();
    trackPaint.color = this.track;
    trackPaint.style = PaintingStyle.stroke;
    trackPaint.strokeWidth = this.thickness;
    trackPaint.strokeCap = StrokeCap.round;
    canvas.drawArc(rect, 0.0, 2 * pi, false, trackPaint);
    final Paint progressPaint = Paint();
    progressPaint.color = this.primary;
    progressPaint.style = PaintingStyle.stroke;
    progressPaint.strokeWidth = this.thickness;
    progressPaint.strokeCap = StrokeCap.round;
    final sweepAngle = (this.realized / this.target).clamp(0.0, 1.0) * 2 * pi;
    canvas.drawArc(rect, -pi / 2, sweepAngle, false, progressPaint);
    if (this.showDeficitStripe && this.realized < this.timeTarget) {
      final Paint deficitPaint = Paint();
      deficitPaint.color = this.deficit.withValues(alpha: 0.9);
      deficitPaint.style = PaintingStyle.stroke;
      deficitPaint.strokeWidth = 2.5;
      deficitPaint.strokeCap = StrokeCap.round;
      const double boundarySweep = 8 * pi / 180;
      final double startAngle =
          -pi / 2 + (this.realized / this.target).clamp(0.0, 1.0) * 2 * pi;
      canvas.drawArc(
        rect,
        startAngle - (boundarySweep / 2),
        boundarySweep,
        false,
        deficitPaint,
      );
      final double endAngle =
          -pi / 2 + (this.timeTarget / this.target).clamp(0.0, 1.0) * 2 * pi;
      canvas.drawArc(
        rect,
        endAngle - (boundarySweep / 2),
        boundarySweep,
        false,
        deficitPaint,
      );
    }
    if (this.showDot) {
      final double dotAngle =
          -pi / 2 + (this.timeTarget / this.target).clamp(0.0, 1.0) * 2 * pi;
      final Offset dotPos = Offset(
        center.dx + radius * cos(dotAngle),
        center.dy + radius * sin(dotAngle),
      );
      final Paint ringPaint = Paint();
      ringPaint.color = (this.realized >= this.timeTarget)
          ? this.success
          : this.deficit;
      ringPaint.style = PaintingStyle.stroke;
      ringPaint.strokeWidth = this.thickness * 0.5;
      canvas.drawCircle(dotPos, 6.0, ringPaint);
      final Paint centerPaint = Paint();
      centerPaint.color = this.dotCenter;
      canvas.drawCircle(dotPos, 3.0, centerPaint);
    }
  }
}
