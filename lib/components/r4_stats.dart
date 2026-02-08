import 'package:flutter/material.dart';
import 'package:nowa_runtime/nowa_runtime.dart';
import 'package:leela_cloud_2026/components/r4_metric_cell.dart';
import 'package:leela_cloud_2026/components/w_g_t_s_t_radar_chart.dart';

@NowaGenerated()
class R4Stats extends StatelessWidget {
  @NowaGenerated({'loader': 'auto-constructor'})
  const R4Stats({
    required this.currentPageIndex,
    required this.onPageChanged,
    this.counts,
    this.distributions,
    super.key,
  });

  final int currentPageIndex;

  final Function(int index) onPageChanged;

  final Map<String, dynamic>? counts;

  final Map<String, List<Map<String, dynamic>>>? distributions;

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
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                R4MetricCell(label: 'Epics', value: '2'),
                R4MetricCell(label: 'Blocks', value: '23'),
                R4MetricCell(label: 'Chunks', value: '134'),
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
                    slices: [
                      {'label': 'P', 'value': 0.7},
                      {'label': 'M', 'value': 0.6},
                      {'label': 'C', 'value': 0.8},
                      {'label': 'R', 'value': 0.5},
                    ],
                  ),
                  WGT_ST_RadarChart(
                    title: 'Activity Types',
                    slices: [
                      {'label': 'Listen', 'value': 0.6},
                      {'label': 'Read', 'value': 0.7},
                      {'label': 'Watch', 'value': 0.8},
                      {'label': 'Vocal', 'value': 0.4},
                      {'label': 'Move', 'value': 0.5},
                      {'label': 'Process', 'value': 0.7},
                      {'label': 'Test', 'value': 0.6},
                      {'label': 'Meditate', 'value': 0.3},
                    ],
                  ),
                  WGT_ST_RadarChart(
                    title: 'Platforms',
                    slices: [
                      {'label': 'App', 'value': 0.6},
                      {'label': 'Web', 'value': 0.7},
                      {'label': 'Video', 'value': 0.8},
                      {'label': 'Book', 'value': 0.6},
                      {'label': 'Audio', 'value': 0.5},
                      {'label': 'Music', 'value': 0.4},
                      {'label': 'Online', 'value': 0.7},
                      {'label': 'Offline', 'value': 0.3},
                      {'label': 'Exercise', 'value': 0.5},
                      {'label': 'Other', 'value': 0.2},
                    ],
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
