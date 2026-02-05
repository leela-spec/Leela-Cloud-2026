import 'package:flutter/material.dart';
import 'package:nowa_runtime/nowa_runtime.dart';
import 'package:leela_cloud_2026/radar_chart_painter.dart';

@NowaGenerated()
class WGT_ST_RadarChart extends StatelessWidget {
  @NowaGenerated({'loader': 'auto-constructor'})
  const WGT_ST_RadarChart({
    super.key,
    required this.title,
    required this.slices,
  });

  final String title;

  final List<dynamic> slices;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: CustomPaint(
              painter: RadarChartPainter(
                slices: slices,
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Container(),
            ),
          ),
        ),
      ],
    );
  }
}
