import 'package:flutter/material.dart';
import 'package:nowa_runtime/nowa_runtime.dart';
import 'package:leela_cloud_2026/components/w_g_t_s_t_tree_view.dart';

@NowaGenerated()
class R3TreeArea extends StatelessWidget {
  @NowaGenerated({'loader': 'auto-constructor'})
  const R3TreeArea({
    super.key,
    required this.expandedNodeIds,
    this.onToggle,
    this.onChunkTap,
  });

  final List<String> expandedNodeIds;

  final Function(String nodeId)? onToggle;

  final Function(dynamic chunkPayload)? onChunkTap;

  List<Map<String, dynamic>> get _mockTreeData {
    return [
      {
        'id': 'epic_1',
        'type': 'epic',
        'name': 'Epic 1: Foundation Skills',
        'symbols': [Icons.grid_3x3, Icons.fitness_center, Icons.psychology],
      },
      {
        'id': 'epic_2',
        'type': 'epic',
        'name': 'Epic 2: Advanced Mastery',
        'symbols': [Icons.grid_3x3, Icons.handyman, Icons.self_improvement],
      },
      {
        'id': 'block_1',
        'type': 'block',
        'name': 'Block 1: Getting Started',
        'symbols': [
          Icons.apps,
          Icons.menu_book,
          Icons.ondemand_video,
          Icons.headphones,
        ],
      },
      {
        'id': 'block_2',
        'type': 'block',
        'name': 'Block 2: Core Practice',
        'symbols': [Icons.apps, Icons.fitness_center, Icons.directions_run],
      },
      {
        'id': 'chunk_1',
        'type': 'chunk',
        'name': 'Chunk 1: Introduction to Fundamentals',
        'symbols': [
          Icons.view_in_ar,
          Icons.menu_book,
          Icons.headphones,
          Icons.ondemand_video,
          Icons.checklist,
          Icons.quiz,
        ],
      },
      {
        'id': 'chunk_2',
        'type': 'chunk',
        'name': 'Chunk 2: Building Strong Habits',
        'symbols': [
          Icons.view_in_ar,
          Icons.directions_run,
          Icons.self_improvement,
          Icons.checklist,
          Icons.layers,
        ],
      },
      {
        'id': 'chunk_3',
        'type': 'chunk',
        'name': 'Chunk 3: Creative Expression Workshop',
        'symbols': [
          Icons.view_in_ar,
          Icons.brush,
          Icons.groups,
          Icons.ondemand_video,
          Icons.record_voice_over,
          Icons.dashboard_customize,
        ],
      },
      {
        'id': 'chunk_4',
        'type': 'chunk',
        'name': 'Chunk 4: Testing & Assessment Module',
        'symbols': [
          Icons.view_in_ar,
          Icons.quiz,
          Icons.checklist,
          Icons.menu_book,
          Icons.psychology,
        ],
      },
      {
        'id': 'chunk_5',
        'type': 'chunk',
        'name': 'Chunk 5: Advanced Integration Practice',
        'symbols': [
          Icons.view_in_ar,
          Icons.call_merge,
          Icons.handyman,
          Icons.fitness_center,
          Icons.layers,
          Icons.arrow_right_alt,
        ],
      },
      {
        'id': 'chunk_6',
        'type': 'chunk',
        'name': 'Chunk 6: Mastery & Reflection',
        'symbols': [
          Icons.view_in_ar,
          Icons.self_improvement,
          Icons.weekend,
          Icons.celebration,
          Icons.groups,
        ],
      },
    ];
  }

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
              'Skill Tree',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 400,
              child: WGT_ST_TreeView(
                treeModel: _mockTreeData,
                expandedNodeIds: expandedNodeIds,
                onToggle: onToggle,
                onChunkTap: onChunkTap,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
