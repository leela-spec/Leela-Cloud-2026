import 'package:flutter/material.dart';
import 'package:leela_cloud_2026/models/path_epic_group.dart';
import 'package:leela_cloud_2026/models/donut_metric.dart';
import 'package:nowa_runtime/nowa_runtime.dart';
import 'package:leela_cloud_2026/pages/s_c_r_placeholder.dart';
import 'package:leela_cloud_2026/components/c_m_p_nav_top_bar.dart';
import 'package:leela_cloud_2026/components/c_m_p_metric_donut.dart';

@NowaGenerated()
class SCR_Path_Main extends StatefulWidget {
  @NowaGenerated({'loader': 'auto-constructor'})
  const SCR_Path_Main({super.key});

  @override
  State<SCR_Path_Main> createState() {
    return _SCR_Path_MainState();
  }
}

@NowaGenerated()
class _SCR_Path_MainState extends State<SCR_Path_Main> {
  List<PathEpicGroup> v_pathEpicGroups = [];

  List<DonutMetric> v_pathMetrics = [];

  List<String> v_expandedEpicIds = [];

  List<String> v_sidGuidance = [];

  bool v_isLoading = false;

  String? v_errorMessage;

  void fn_openSidExplainer() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Sid explainer coming soon!')));
  }

  void _navigateToSearch() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SCR_Placeholder()),
    );
  }

  void _navigateToSettings() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SCR_Placeholder()),
    );
  }

  void fn_openProgressDetail() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Progress detail coming soon!')),
    );
  }

  void fn_openAddChunksPicker() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Add Chunks picker coming soon!')),
    );
  }

  void fn_openSidGuidanceDetail() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Sid\'s guidance detail coming soon!')),
    );
  }

  void fn_openCyclePlanner() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Cycle planner coming soon!')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CMP_Nav_TopBar(
              p_title: 'Path',
              p_showSearch: true,
              p_showSettings: true,
              p_showSid: true,
              p_navOrder: const ['search', 'settings', 'home', 'sid'],
              p_onTapSearch: _navigateToSearch,
              p_onTapSettings: _navigateToSettings,
              p_onTapSid: (screenId) => fn_openSidExplainer(),
              p_screenId: 'path_main',
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Theme.of(
                            context,
                          ).colorScheme.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'This Week\'s Progress',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.titleMedium,
                                ),
                                IconButton(
                                  onPressed: fn_openProgressDetail,
                                  icon: const Icon(Icons.north_east),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                const Expanded(
                                  child: SizedBox(
                                    height: 110,
                                    child: CMP_Metric_Donut(
                                      p_label: 'TP',
                                      p_realized: 45,
                                      p_timeTarget: 40,
                                      p_target: 100,
                                      p_open: 20,
                                      p_planned: 35,
                                      p_metricId: 'tp_main',
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                const Expanded(
                                  child: SizedBox(
                                    height: 110,
                                    child: CMP_Metric_Donut(
                                      p_label: 'Epic',
                                      p_realized: 30,
                                      p_timeTarget: 50,
                                      p_target: 100,
                                      p_open: 50,
                                      p_planned: 20,
                                      p_metricId: 'epic_main',
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                const Expanded(
                                  child: SizedBox(
                                    height: 110,
                                    child: CMP_Metric_Donut(
                                      p_label: 'Skill',
                                      p_realized: 60,
                                      p_timeTarget: 30,
                                      p_target: 100,
                                      p_open: 10,
                                      p_planned: 30,
                                      p_metricId: 'skill_main',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Theme.of(
                            context,
                          ).colorScheme.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Your Path',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.titleMedium,
                                ),
                                TextButton.icon(
                                  onPressed: fn_openAddChunksPicker,
                                  icon: const Icon(Icons.add),
                                  label: const Text('Add Chunks'),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            if (v_pathEpicGroups.isEmpty)
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 20,
                                  ),
                                  child: Text(
                                    'No chunks yet. Add your first chunks to build this week.',
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.onSurfaceVariant,
                                        ),
                                  ),
                                ),
                              )
                            else
                              const SizedBox(
                                height: 100,
                                child: Center(
                                  child: Text('Epic-group list placeholder'),
                                ),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Theme.of(
                            context,
                          ).colorScheme.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Sid\'s Guidance',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.titleMedium,
                                ),
                                IconButton(
                                  onPressed: fn_openSidGuidanceDetail,
                                  icon: const Icon(Icons.north_east),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Card(
                              elevation: 0,
                              color: Theme.of(context).colorScheme.surface,
                              child: const Padding(
                                padding: EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      '• Focus on finishing current Epics before adding more.',
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      '• Your TP balance is looking healthy for this cycle.',
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      '• Consider exploring "Future Cycles" for long-term planning.',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Theme.of(
                            context,
                          ).colorScheme.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Future Cycles (mock)',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.titleMedium,
                                ),
                                IconButton(
                                  onPressed: fn_openCyclePlanner,
                                  icon: const Icon(Icons.north_east),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Image.network(
                                'https://images.unsplash.com/photo-1508921234172-b68ed335b3e6?w=600',
                                height: 150,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
