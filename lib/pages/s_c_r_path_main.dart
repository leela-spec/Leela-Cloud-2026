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
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Theme.of(
                            context,
                          ).colorScheme.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(8.0),
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
                            const SizedBox(height: 12.0),
                            Row(
                              children: [
                                const Expanded(
                                  child: SizedBox(
                                    height: 110.0,
                                    child: CMP_Metric_Donut(
                                      p_label: 'TP',
                                      p_realized: 45,
                                      p_open: 20,
                                      p_planned: 35,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12.0),
                                const Expanded(
                                  child: SizedBox(
                                    height: 110.0,
                                    child: CMP_Metric_Donut(
                                      p_label: 'Epic',
                                      p_realized: 30,
                                      p_open: 50,
                                      p_planned: 20,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12.0),
                                const Expanded(
                                  child: SizedBox(
                                    height: 110.0,
                                    child: CMP_Metric_Donut(
                                      p_label: 'Skill',
                                      p_realized: 60,
                                      p_open: 10,
                                      p_planned: 30,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12.0),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Theme.of(
                            context,
                          ).colorScheme.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(8.0),
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
                            const SizedBox(height: 12.0),
                            if (v_pathEpicGroups.isEmpty)
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 20.0,
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
                                height: 100.0,
                                child: Center(
                                  child: Text('Epic-group list placeholder'),
                                ),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12.0),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Theme.of(
                            context,
                          ).colorScheme.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Center(
                          child: Text(
                            'Sid\'s Guidance Placeholder',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12.0),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Theme.of(
                            context,
                          ).colorScheme.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Center(
                          child: Text(
                            'Future Cycles Placeholder',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
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
