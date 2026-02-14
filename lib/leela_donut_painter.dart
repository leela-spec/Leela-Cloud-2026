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
    final trackPaint = Paint()
      ..color = this.track
      ..style = PaintingStyle.stroke
      ..strokeWidth = this.thickness
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(rect, 0.0, 2 * pi, false, trackPaint);
    final progressPaint = Paint()
      ..color = this.primary
      ..style = PaintingStyle.stroke
      ..strokeWidth = this.thickness
      ..strokeCap = StrokeCap.round;
    final sweepAngle = (this.realized / this.target).clamp(0.0, 1.0) * 2 * pi;
    canvas.drawArc(rect, -pi / 2, sweepAngle, false, progressPaint);
    if (this.showDeficitStripe && this.realized < this.timeTarget) {
      final deficitPaint = Paint()
        ..color = this.deficit
        ..style = PaintingStyle.stroke
        ..strokeWidth = this.thickness
        ..strokeCap = StrokeCap.round;
      final startAngle =
          -pi / 2 + (this.realized / this.target).clamp(0.0, 1.0) * 2 * pi;
      final deficitSweep =
          ((this.timeTarget - this.realized) / this.target).clamp(0.0, 1.0) *
          2 *
          pi;
      canvas.drawArc(rect, startAngle, deficitSweep, false, deficitPaint);
    }
    if (this.showDot) {
      final dotAngle =
          -pi / 2 + (this.timeTarget / this.target).clamp(0.0, 1.0) * 2 * pi;
      final dotPos = Offset(
        center.dx + radius * cos(dotAngle),
        center.dy + radius * sin(dotAngle),
      );
      final ringPaint = Paint()..color = this.dotRing;
      canvas.drawCircle(dotPos, 6.0, ringPaint);
      final centerPaint = Paint()..color = this.dotCenter;
      canvas.drawCircle(dotPos, 3.0, centerPaint);
    }
  }
}
