import 'package:flutter/material.dart';
import 'package:nowa_runtime/nowa_runtime.dart';
import 'package:leela_cloud_2026/globals/g_s_data.dart';
import 'package:leela_cloud_2026/models/scope_selection_result.dart';
import 'package:leela_cloud_2026/pages/s_c_r_picker_scope.dart';
import 'package:leela_cloud_2026/globals/g_s_spark.dart';
import 'package:leela_cloud_2026/pages/s_c_r_picker_duration.dart';
import 'package:leela_cloud_2026/components/c_m_p_nav_top_bar.dart';
import 'package:leela_cloud_2026/components/c_m_p_row_feature_tabs.dart';
import 'package:leela_cloud_2026/components/c_m_p_metric_donut.dart';
import 'package:leela_cloud_2026/components/c_m_p_table_upcoming.dart';
import 'package:leela_cloud_2026/components/c_m_p_hero_carousel.dart';
import 'package:leela_cloud_2026/pages/s_c_r_spark_pre_run.dart';

@NowaGenerated()
class SCR_Home_Today extends StatefulWidget {
  @NowaGenerated({'loader': 'auto-constructor'})
  const SCR_Home_Today({super.key});

  @override
  State<SCR_Home_Today> createState() {
    return _SCR_Home_TodayState();
  }
}

@NowaGenerated()
class _SCR_Home_TodayState extends State<SCR_Home_Today> {
  bool v_isUpcomingExpanded = false;

  bool v_isLoading = false;

  bool v_hasError = false;

  int v_activeHeroIndex = 0;

  String v_homeOrbTab = 'st';

  @override
  void initState() {
    super.initState();
    GS_Data.of(context).fn_seedHomeMockData();
  }

  void fn_toggleUpcomingExpanded() {
    setState(() {
      v_isUpcomingExpanded = !v_isUpcomingExpanded;
    });
  }

  void fn_home_setHeroIndex(int pNewindex) {
    setState(() {
      v_activeHeroIndex = pNewindex;
    });
  }

  void fn_home_setOrbTab(String pKey) {
    setState(() {
      v_homeOrbTab = pKey;
    });
  }

  void fn_showMetricInfo(String pMetricid) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Metric Info'),
        content: Text(
          'Metric ID: $pMetricid\n\nDetailed metric information will be displayed here.',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  Future<void>? fn_openScopePicker() async {
    final result = await Navigator.push<ScopeSelectionResult?>(
      context,
      MaterialPageRoute(builder: (context) => const SCR_Picker_Scope()),
    );
    if (result != null) {
      GS_Spark.of(context).setScope(result);
    }
  }

  Future<void>? fn_openDurationPicker() async {
    final result = await Navigator.push<int?>(
      context,
      MaterialPageRoute(builder: (context) => const SCR_Picker_Duration()),
    );
    if (result != null) {
      GS_Spark.of(context).setMaxDuration(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    final gsData = GS_Data.of(context);
    final gsSpark = GS_Spark.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CMP_Nav_TopBar(
              p_title: 'Home',
              p_showSearch: true,
              p_showSettings: true,
              p_showSid: true,
              p_navOrder: const ['search', 'settings', 'home', 'sid'],
              p_onTapSearch: () {},
              p_onTapSettings: () {},
              p_onTapSid: (screenId) {},
              p_screenId: 'SCR_Home_Today',
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16.0),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Container(
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          color: Theme.of(
                            context,
                          ).colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color: Theme.of(
                              context,
                            ).colorScheme.outline.withValues(alpha: 0.3),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Leela Orb / Multi Epic Skill Tree (placeholder)',
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.onSurface
                                      .withValues(alpha: 0.6),
                                ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    CMP_Row_FeatureTabs(
                      p_items: gsData.g_tabs,
                      p_activeKey: v_homeOrbTab,
                      p_onSelectTab: fn_home_setOrbTab,
                      p_onOpenTab: (route) {},
                    ),
                    const SizedBox(height: 24.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Achievements',
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurface,
                                ),
                          ),
                          const SizedBox(height: 16.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CMP_Metric_Donut(
                                p_label: gsData.g_metrics.isNotEmpty
                                    ? gsData.g_metrics[0].label
                                    : 'TP',
                                p_realized: gsData.g_metrics.isNotEmpty
                                    ? gsData.g_metrics[0].realized
                                    : 0,
                                p_open: gsData.g_metrics.isNotEmpty
                                    ? gsData.g_metrics[0].open
                                    : 0,
                                p_planned: gsData.g_metrics.isNotEmpty
                                    ? gsData.g_metrics[0].planned
                                    : 0,
                                p_metricId: gsData.g_metrics.isNotEmpty
                                    ? gsData.g_metrics[0].id
                                    : 'metric_tp',
                                p_onInfo: fn_showMetricInfo,
                              ),
                              CMP_Metric_Donut(
                                p_label: gsData.g_metrics.length > 1
                                    ? gsData.g_metrics[1].label
                                    : 'XP',
                                p_realized: gsData.g_metrics.length > 1
                                    ? gsData.g_metrics[1].realized
                                    : 0,
                                p_open: gsData.g_metrics.length > 1
                                    ? gsData.g_metrics[1].open
                                    : 0,
                                p_planned: gsData.g_metrics.length > 1
                                    ? gsData.g_metrics[1].planned
                                    : 0,
                                p_metricId: gsData.g_metrics.length > 1
                                    ? gsData.g_metrics[1].id
                                    : 'metric_xp',
                                p_onInfo: fn_showMetricInfo,
                              ),
                              CMP_Metric_Donut(
                                p_label: gsData.g_metrics.length > 2
                                    ? gsData.g_metrics[2].label
                                    : 'BP',
                                p_realized: gsData.g_metrics.length > 2
                                    ? gsData.g_metrics[2].realized
                                    : 0,
                                p_open: gsData.g_metrics.length > 2
                                    ? gsData.g_metrics[2].open
                                    : 0,
                                p_planned: gsData.g_metrics.length > 2
                                    ? gsData.g_metrics[2].planned
                                    : 0,
                                p_metricId: gsData.g_metrics.length > 2
                                    ? gsData.g_metrics[2].id
                                    : 'metric_bp',
                                p_onInfo: fn_showMetricInfo,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: CMP_Table_Upcoming(
                        p_rows: gsData.g_upcomingRows,
                        p_isExpanded: v_isUpcomingExpanded,
                        p_onToggle: fn_toggleUpcomingExpanded,
                        p_onTapRow: (rowId) {},
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12.0,
                                ),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.primary,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Text(
                                  'Spark',
                                  style: Theme.of(context).textTheme.bodyMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.onPrimary,
                                      ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12.0,
                                ),
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .surfaceContainerHighest
                                      .withValues(alpha: 0.5),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Text(
                                  'Session',
                                  style: Theme.of(context).textTheme.bodyMedium
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface
                                            .withValues(alpha: 0.5),
                                      ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12.0,
                                ),
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .surfaceContainerHighest
                                      .withValues(alpha: 0.5),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Text(
                                  'Flow',
                                  style: Theme.of(context).textTheme.bodyMedium
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface
                                            .withValues(alpha: 0.5),
                                      ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    CMP_HeroCarousel(
                      p_items: gsData.g_heroItems,
                      p_activeIndex: v_activeHeroIndex,
                      p_onSwipe: fn_home_setHeroIndex,
                      p_onTapItem: fn_openSparkPreRun,
                    ),
                    const SizedBox(height: 24.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: fn_openScopePicker,
                              child: Container(
                                padding: const EdgeInsets.all(12.0),
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .surfaceContainerHighest
                                      .withValues(alpha: 0.5),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Scope',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall
                                          ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurface
                                                .withValues(alpha: 0.6),
                                          ),
                                    ),
                                    const SizedBox(height: 4.0),
                                    Text(
                                      gsSpark.g_scope?.label ?? 'All Epics',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.onSurface,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12.0),
                          Expanded(
                            child: GestureDetector(
                              onTap: fn_openDurationPicker,
                              child: Container(
                                padding: const EdgeInsets.all(12.0),
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .surfaceContainerHighest
                                      .withValues(alpha: 0.5),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Duration',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall
                                          ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurface
                                                .withValues(alpha: 0.6),
                                          ),
                                    ),
                                    const SizedBox(height: 4.0),
                                    Text(
                                      gsSpark.g_maxDurationSeconds == -1
                                          ? 'No limit'
                                          : '${(gsSpark.g_maxDurationSeconds / 60).round()} min',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.onSurface,
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
                    const SizedBox(height: 24.0),
                  ],
                ),
              ),
            ),
            Container(
              height: 60.0,
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(
                      context,
                    ).colorScheme.shadow.withValues(alpha: 0.1),
                    blurRadius: 8.0,
                    offset: const Offset(0.0, -2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.public,
                        color: Theme.of(context).colorScheme.primary,
                        size: 24.0,
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        'Universe',
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.play_circle_outline,
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withValues(alpha: 0.5),
                        size: 24.0,
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        'Play',
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withValues(alpha: 0.5),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.emoji_events_outlined,
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withValues(alpha: 0.5),
                        size: 24.0,
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        'Kharma',
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withValues(alpha: 0.5),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void fn_openSparkPreRun(String pChunkid) {
    final gsData = GS_Data.of(context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            SCR_Spark_PreRun(p_chunkId: pChunkid, p_reco: gsData.g_reco),
      ),
    );
  }
}
