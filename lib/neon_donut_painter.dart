import 'package:flutter/material.dart';
import 'package:nowa_runtime/nowa_runtime.dart';
import 'dart:math';

@NowaGenerated()
class NeonDonutPainter extends CustomPainter {
  NeonDonutPainter({
    required this.cs,
    required this.label,
    required this.realized,
    required this.timeTarget,
    required this.target,
    required this.strokeWidth,
    required this.pulse,
  });

  final ColorScheme cs;

  final String label;

  final double realized;

  final double timeTarget;

  final double target;

  final double strokeWidth;

  final double pulse;

  @override
  void paint(Canvas canvas, Size size) {
    final double cx = size.width / 2;
    final double cy = size.height / 2;
    final Offset center = Offset(cx, cy);
    final double minDim = size.width < size.height ? size.width : size.height;
    final double radius = (minDim - strokeWidth) / 2;
    final Rect rect = Rect.fromCircle(center: center, radius: radius);
    const double startAngle = -3.14159 / 2;
    const double fullSweep = 3.14159 * 2;
    final double safeTarget = target <= 0 ? 1.0 : target;
    final double realizedRatio = (realized / safeTarget).clamp(0.0, 1.0);
    final double timeTargetRatio = (timeTarget / safeTarget).clamp(0.0, 1.0);
    final Paint trackPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..color = cs.primary.withOpacity(0.18);
    canvas.drawArc(rect, startAngle, fullSweep, false, trackPaint);
    final Paint remainingPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..color = cs.primary.withOpacity(0.35);
    canvas.drawArc(rect, startAngle, fullSweep, false, remainingPaint);
    final Paint fillPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..color = cs.primary;
    canvas.drawArc(
      rect,
      startAngle,
      fullSweep * realizedRatio,
      false,
      fillPaint,
    );
    final Paint glowPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth + 3
      ..strokeCap = StrokeCap.round
      ..color = cs.primary.withOpacity(0.22)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 3.0);
    canvas.drawArc(
      rect,
      startAngle,
      fullSweep * realizedRatio,
      false,
      glowPaint,
    );
    final bool isAhead = realized >= timeTarget;
    final Color dotColor = isAhead
        ? const Color(0xFF00E676)
        : const Color(0xFFFF2D55);
    final double angle = startAngle + fullSweep * timeTargetRatio;
    final Offset dotCenter = Offset(
      center.dx + cos(angle) * radius,
      center.dy + sin(angle) * radius,
    );
    final Paint dotPaint = Paint()..color = dotColor.withOpacity(0.95);
    canvas.drawCircle(dotCenter, 3.2, dotPaint);
    final tp = TextPainter(
      text: TextSpan(
        text: label,
        style: TextStyle(
          color: cs.onSurface.withOpacity(0.92),
          fontWeight: FontWeight.w600,
          fontSize: 14.0,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    tp.paint(
      canvas,
      Offset(center.dx - tp.width / 2, center.dy - tp.height / 2),
    );
  }

  @override
  bool shouldRepaint(NeonDonutPainter old) {
    return old.realized != realized ||
        old.timeTarget != timeTarget ||
        old.target != target ||
        old.pulse != pulse ||
        old.strokeWidth != strokeWidth;
  }
}
