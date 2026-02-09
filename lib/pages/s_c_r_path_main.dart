import 'package:flutter/material.dart';
import 'package:leela_cloud_2026/models/path_epic_group.dart';
import 'package:leela_cloud_2026/models/donut_metric.dart';
import 'package:nowa_runtime/nowa_runtime.dart';
import 'package:leela_cloud_2026/pages/s_c_r_placeholder.dart';
import 'package:leela_cloud_2026/components/c_m_p_nav_top_bar.dart';

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
                        child: Center(
                          child: Text(
                            'This Week\'s Progress Placeholder',
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
                            'Your Path Placeholder',
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
