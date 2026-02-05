import 'package:flutter/material.dart';
import 'package:nowa_runtime/nowa_runtime.dart';
import 'dart:math';

@NowaGenerated()
class RadarChartPainter extends CustomPainter {
  RadarChartPainter({required this.slices, required this.color});

  final List<dynamic> slices;

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    if (slices.isEmpty) {
      return;
    }
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) / 2 - 20;
    final angleStep = 2 * pi / slices.length;
    final gridPaint = Paint()
      ..color = color.withValues(alpha: 0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    for (int i = 1; i <= 5; i++) {
      final gridRadius = radius * i / 5;
      final gridPath = Path();
      for (int j = 0; j < slices.length; j++) {
        final angle = j * angleStep - pi / 2;
        final x = center.dx + gridRadius * cos(angle);
        final y = center.dy + gridRadius * sin(angle);
        if (j == 0) {
          gridPath.moveTo(x, y);
        } else {
          gridPath.lineTo(x, y);
        }
      }
      gridPath.close();
      canvas.drawPath(gridPath, gridPaint);
    }
    for (int i = 0; i < slices.length; i++) {
      final angle = i * angleStep - pi / 2;
      final x = center.dx + radius * cos(angle);
      final y = center.dy + radius * sin(angle);
      canvas.drawLine(center, Offset(x, y), gridPaint);
    }
    final dataPaint = Paint()
      ..color = color.withValues(alpha: 0.5)
      ..style = PaintingStyle.fill;
    final dataPath = Path();
    for (int i = 0; i < slices.length; i++) {
      final slice = slices[i];
      final value = slice is Map ? (slice['value'] ?? 0.5) : 0.5;
      final normalizedValue = (value is num ? value.toDouble() : 0.5).clamp(
        0,
        1,
      );
      final angle = i * angleStep - pi / 2;
      final distance = radius * normalizedValue;
      final x = center.dx + distance * cos(angle);
      final y = center.dy + distance * sin(angle);
      if (i == 0) {
        dataPath.moveTo(x, y);
      } else {
        dataPath.lineTo(x, y);
      }
    }
    dataPath.close();
    canvas.drawPath(dataPath, dataPaint);
    final strokePaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawPath(dataPath, strokePaint);
  }

  @override
  bool shouldRepaint(RadarChartPainter oldDelegate) {
    return oldDelegate.slices != slices || oldDelegate.color != color;
  }
}
