import 'package:flutter/material.dart';
import 'package:leela_cloud_2026/models/feature_tab_item.dart';
import 'package:leela_cloud_2026/models/hero_item.dart';
import 'package:leela_cloud_2026/models/upcoming_row.dart';
import 'package:leela_cloud_2026/models/donut_metric.dart';
import 'package:leela_cloud_2026/models/recommendation_chunk.dart';
import 'package:leela_cloud_2026/path_epic_group.dart';
import 'package:nowa_runtime/nowa_runtime.dart';
import 'package:leela_cloud_2026/models/path_item_row.dart';
import 'package:provider/provider.dart';

@NowaGenerated()
class GS_Data extends ChangeNotifier {
  GS_Data();

  factory GS_Data.of(BuildContext context, {bool listen = false}) {
    return Provider.of<GS_Data>(context, listen: listen);
  }

  List<FeatureTabItem> g_tabs = [];

  List<HeroItem> g_heroItems = [];

  List<UpcomingRow> g_upcomingRows = [];

  List<DonutMetric> g_metrics = [];

  RecommendationChunk? g_reco;

  bool g_isSeeded = false;

  List<PathEpicGroup> g_pathEpicGroupsNatalia = [];

  List<String> g_pathSidGuidanceNatalia = [];

  void fn_seedHomeMockData() {
    if (g_isSeeded == true) {
      return;
    }
    g_tabs = [
      const FeatureTabItem(id: 'tab_1', key: 'st', label: 'St', route: '/st'),
      const FeatureTabItem(id: 'tab_2', key: 'pa', label: 'Pa', route: '/pa'),
      const FeatureTabItem(id: 'tab_3', key: 'rh', label: 'Rh', route: '/rh'),
      const FeatureTabItem(id: 'tab_4', key: 'se', label: 'Se', route: '/se'),
      const FeatureTabItem(id: 'tab_5', key: 'ss', label: 'Ss', route: '/ss'),
    ];
    g_heroItems = [
      const HeroItem(
        id: 'hero_1',
        chunkId: 'CH_4b0c468b2126ab',
        title: 'Elen - Liegen ist Frieden',
        platform: 'Spotify',
        epicBlock: 'LL German — Music / Alex List',
        tp: 4,
        xp: 4,
        bp: 4,
        symbolKey: 'music',
      ),
      const HeroItem(
        id: 'hero_2',
        chunkId: 'CH_d009adaadee3da',
        title: 'Seeed - Aufstehn',
        platform: 'Spotify',
        epicBlock: 'LL German — Music / Alex List',
        tp: 4,
        xp: 4,
        bp: 4,
        symbolKey: 'music',
      ),
      const HeroItem(
        id: 'hero_3',
        chunkId: 'CH_03bd7a5c6982dc',
        title: 'Liegen ist Frieden Flashcards',
        platform: null,
        epicBlock: 'LL German — Vocabulary/Memory / Flashcard Apps / Music',
        tp: 1,
        xp: 3,
        bp: 7,
        symbolKey: 'flashcards',
      ),
    ];
    g_upcomingRows = [
      const UpcomingRow(
        id: 'upcoming_1',
        startLabel: '17:00',
        name: 'Office Meeting',
        timeUntilLabel: '23m',
      ),
      const UpcomingRow(
        id: 'upcoming_2',
        startLabel: '19:00',
        name: 'Yoga Class',
        timeUntilLabel: '2:23h',
      ),
      const UpcomingRow(
        id: 'upcoming_3',
        startLabel: '22:00',
        name: 'Shut Down',
        timeUntilLabel: '5:23h',
      ),
    ];
    g_metrics = [
      const DonutMetric(
        id: 'metric_tp',
        label: 'TP',
        realized: 121,
        open: 79,
        planned: 200,
      ),
      const DonutMetric(
        id: 'metric_xp',
        label: 'XP',
        realized: 176,
        open: 74,
        planned: 250,
      ),
      const DonutMetric(
        id: 'metric_bp',
        label: 'BP',
        realized: 60,
        open: 60,
        planned: 120,
      ),
    ];
    g_reco = const RecommendationChunk(
      chunkId: 'CH_4b0c468b2126ab',
      chunkTitle: 'Elen - Liegen ist Frieden',
      platformName: 'Spotify',
      sequenceTypeLabel: 'Spark — Next Best',
      epicBlockLabel: 'LL German — Music / Alex List',
      rewardTP: 4,
      rewardXP: 4,
      rewardBP: 4,
      symbolKey: 'music',
    );
    if (g_pathEpicGroupsNatalia.isEmpty) {
      g_pathEpicGroupsNatalia = [
        PathEpicGroup(
          epicId: 'epic_german',
          epicTitle: 'LL German',
          rows: [
            PathItemRow(
              id: 'row_1',
              title: 'Liegen ist Frieden - Listening',
              branchCode: 'M',
              tpPlannedMin: 15,
              priorityUi: 1,
            ),
            PathItemRow(
              id: 'row_2',
              title: 'Vocabulary Flashcards',
              branchCode: 'C',
              tpPlannedMin: 20,
              priorityUi: 2,
            ),
            PathItemRow(
              id: 'row_3',
              title: 'Grammar Practice',
              branchCode: 'P',
              tpPlannedMin: 25,
              priorityUi: 1,
            ),
            PathItemRow(
              id: 'row_4',
              title: 'Conversation Practice',
              branchCode: 'R',
              tpPlannedMin: 30,
              priorityUi: 3,
            ),
            PathItemRow(
              id: 'row_5',
              title: 'Reading Comprehension',
              branchCode: 'P',
              tpPlannedMin: 20,
              priorityUi: 2,
            ),
            PathItemRow(
              id: 'row_6',
              title: 'Music Analysis',
              branchCode: 'M',
              tpPlannedMin: 10,
              priorityUi: 3,
            ),
          ],
        ),
      ];
    }
    if (g_pathSidGuidanceNatalia.isEmpty) {
      g_pathSidGuidanceNatalia = [
        'Focus on music-based learning this week to make vocabulary stick naturally.',
        'Balance your practice time between active speaking and passive listening.',
        'Consider reviewing flashcards right after music sessions for better retention.',
      ];
    }
    g_isSeeded = true;
    notifyListeners();
  }
}
