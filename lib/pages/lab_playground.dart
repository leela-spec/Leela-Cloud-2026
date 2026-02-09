import 'package:flutter/material.dart';
import 'package:nowa_runtime/nowa_runtime.dart';
import 'package:leela_cloud_2026/pages/page_screen_template.dart';
import 'package:leela_cloud_2026/pages/s_c_r_skill_tree.dart';
import 'package:leela_cloud_2026/pages/s_c_r_home_today.dart';
import 'package:leela_cloud_2026/pages/s_c_r_path_main.dart';
import 'package:leela_cloud_2026/pages/s_c_r_spark_pre_run.dart';
import 'package:leela_cloud_2026/pages/s_c_r_picker_scope.dart';
import 'package:leela_cloud_2026/pages/s_c_r_picker_duration.dart';

@NowaGenerated()
class _NavigationListItem extends StatelessWidget {
  @NowaGenerated({'loader': 'auto-constructor'})
  const _NavigationListItem({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  final String title;

  final IconData icon;

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12.0),
      elevation: 2.0,
      child: ListTile(
        leading: Icon(
          icon,
          color: Theme.of(context).colorScheme.primary,
          size: 28.0,
        ),
        title: Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16.0,
          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5),
        ),
        onTap: onTap,
      ),
    );
  }
}

@NowaGenerated()
class LabPlayground extends StatelessWidget {
  @NowaGenerated({'loader': 'auto-constructor'})
  const LabPlayground({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab Playground'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _NavigationListItem(
            title: 'Screen Template',
            icon: Icons.dashboard_outlined,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PageScreenTemplate(),
                ),
              );
            },
          ),
          _NavigationListItem(
            title: 'Skill Tree.',
            icon: Icons.account_tree,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SCR_SkillTree()),
              );
            },
          ),
          _NavigationListItem(
            title: 'Home Today',
            icon: Icons.home,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SCR_Home_Today()),
              );
            },
          ),
          _NavigationListItem(
            title: 'Path Main',
            icon: Icons.route,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SCR_Path_Main()),
              );
            },
          ),
          _NavigationListItem(
            title: 'Spark Pre-Run',
            icon: Icons.flash_on,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const SCR_Spark_PreRun(p_chunkId: 'test-chunk'),
                ),
              );
            },
          ),
          _NavigationListItem(
            title: 'Scope Picker',
            icon: Icons.filter_list,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SCR_Picker_Scope(),
                ),
              );
            },
          ),
          _NavigationListItem(
            title: 'Duration Picker',
            icon: Icons.access_time,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SCR_Picker_Duration(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
