import 'package:flutter/material.dart';
import 'package:nowa_runtime/nowa_runtime.dart';
import 'package:leela_cloud_2026/components/r4_metric_cell.dart';
import 'package:leela_cloud_2026/components/w_g_t_s_t_radar_chart.dart';

@NowaGenerated()
class ST_R4StatsBound extends StatelessWidget {
  @NowaGenerated({'loader': 'auto-constructor'})
  const ST_R4StatsBound({
    super.key,
    required this.counts,
    required this.distributions,
    required this.currentPageIndex,
    required this.onPageChanged,
  });

  final Map<String, dynamic> counts;

  final Map<String, List<Map<String, dynamic>>> distributions;

  final int currentPageIndex;

  final Function(int index) onPageChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Stats',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                R4MetricCell(label: 'Epics', value: counts['epics'] ?? '0'),
                R4MetricCell(label: 'Blocks', value: counts['blocks'] ?? '0'),
                R4MetricCell(label: 'Chunks', value: counts['chunks'] ?? '0'),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 250,
              child: PageView(
                onPageChanged: onPageChanged,
                children: [
                  WGT_ST_RadarChart(
                    title: 'Branches',
                    slices: distributions['branches'] ?? [],
                  ),
                  WGT_ST_RadarChart(
                    title: 'Activity Types',
                    slices: distributions['activityTypes'] ?? [],
                  ),
                  WGT_ST_RadarChart(
                    title: 'Platforms',
                    slices: distributions['platforms'] ?? [],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Center(
              child: Text(
                '${currentPageIndex + 1}/3',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
