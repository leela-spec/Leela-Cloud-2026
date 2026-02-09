import 'package:flutter/material.dart';
import 'package:nowa_runtime/nowa_runtime.dart';
import 'package:leela_cloud_2026/components/c_m_p_nav_top_bar.dart';
import 'package:leela_cloud_2026/components/s_t_r3_tree_area_bound.dart';
import 'package:leela_cloud_2026/components/r4_stats.dart';
import 'package:leela_cloud_2026/components/r5_health.dart';

@NowaGenerated()
class _FilterChip extends StatelessWidget {
  @NowaGenerated({'loader': 'auto-constructor'})
  const _FilterChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      label: Text(label),
      onPressed: () {},
      side: BorderSide(color: Theme.of(context).colorScheme.outline),
    );
  }
}

@NowaGenerated()
class _SearchResultItem extends StatelessWidget {
  @NowaGenerated({'loader': 'auto-constructor'})
  const _SearchResultItem({
    required this.title,
    required this.type,
    required this.icon,
  });

  final String title;

  final String type;

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
      title: Text(title),
      subtitle: Text(
        type,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
      onTap: () {},
    );
  }
}

@NowaGenerated()
class _R2_SearchPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Epic Skill Trees',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              IconButton(icon: const Icon(Icons.search), onPressed: () {}),
            ],
          ),
          const SizedBox(height: 8.0),
          Text(
            'Skill Trees',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 4.0),
          Text(
            '(collapsible epics skill tree → blocks → chunks)',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

@NowaGenerated()
class _TreeNode extends StatelessWidget {
  @NowaGenerated({'loader': 'auto-constructor'})
  const _TreeNode({
    required this.icon,
    required this.label,
    required this.level,
  });

  final IconData icon;

  final String label;

  final int level;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: level * 32, top: 8.0, bottom: 8.0),
      child: Row(
        children: [
          Icon(
            icon,
            size: 20.0,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          const SizedBox(width: 12.0),
          Text(
            label,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: level == 0 ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

@NowaGenerated()
class _StatRow extends StatelessWidget {
  @NowaGenerated({'loader': 'auto-constructor'})
  const _StatRow({required this.label, required this.value});

  final String label;

  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: Theme.of(context).textTheme.bodyMedium),
          Text(
            value,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

@NowaGenerated()
class _TableHeader extends StatelessWidget {
  @NowaGenerated({'loader': 'auto-constructor'})
  const _TableHeader({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: Theme.of(
          context,
        ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }
}

@NowaGenerated()
class _TableCell extends StatelessWidget {
  @NowaGenerated({'loader': 'auto-constructor'})
  const _TableCell({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium,
        textAlign: TextAlign.center,
      ),
    );
  }
}

@NowaGenerated()
class _R6_Recommendations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 2.0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Recommended Epics',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16.0),
              const _RecommendationRow(
                title: 'Liegen ist Frieden',
                creator: 'L2L',
                chunks: 65,
                balance: 'Medium',
              ),
              const Divider(height: 1.0),
              const _RecommendationRow(
                title: 'Aufstehen',
                creator: 'L2L',
                chunks: 42,
                balance: 'Low',
              ),
              const Divider(height: 1.0),
              const _RecommendationRow(
                title: 'Benji – Ich will tanzen',
                creator: 'L2L',
                chunks: 28,
                balance: 'High',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

@NowaGenerated()
class _RecommendationRow extends StatelessWidget {
  @NowaGenerated({'loader': 'auto-constructor'})
  const _RecommendationRow({
    required this.title,
    required this.creator,
    required this.chunks,
    required this.balance,
  });

  final String title;

  final String creator;

  final int chunks;

  final String balance;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 0.0,
      ),
      title: Text(
        title,
        style: Theme.of(
          context,
        ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 4.0),
        child: Text(
          '$creator • $chunks chunks • Balance: $balance',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 16.0,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Coming soon'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }
}

@NowaGenerated({'auto-width': 394, 'auto-height': 1008})
class SCR_SkillTree extends StatefulWidget {
  @NowaGenerated({'loader': 'auto-constructor'})
  const SCR_SkillTree({this.focusNodeId, this.focusLevel = '', super.key});

  final String? focusNodeId;

  final String focusLevel;

  static const String route = '/skill-tree';

  @override
  State<SCR_SkillTree> createState() {
    return _SCR_SkillTreeState();
  }
}

@NowaGenerated()
class _SCR_SkillTreeState extends State<SCR_SkillTree> {
  List<String> v_tree_expanded_node_ids = [];

  int v_radar_page_index = 0;

  String v_search_text = '';

  List<Map<String, dynamic>> get qry_ST_TreeModel {
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

  List<Map<String, dynamic>> get qry_ST_SearchIndex {
    return [];
  }

  Map<String, dynamic> get qry_ST_Stats_Counts {
    return {'epics': '2', 'blocks': '23', 'chunks': '134'};
  }

  Map<String, List<Map<String, dynamic>>> get qry_ST_Stats_Distributions {
    return {
      'branches': [
        {'label': 'P', 'value': 0.7},
        {'label': 'M', 'value': 0.6},
        {'label': 'C', 'value': 0.8},
        {'label': 'R', 'value': 0.5},
      ],
      'activityTypes': [
        {'label': 'Listen', 'value': 0.6},
        {'label': 'Read', 'value': 0.7},
        {'label': 'Watch', 'value': 0.8},
        {'label': 'Vocal', 'value': 0.4},
        {'label': 'Move', 'value': 0.5},
        {'label': 'Process', 'value': 0.7},
        {'label': 'Test', 'value': 0.6},
        {'label': 'Meditate', 'value': 0.3},
      ],
      'platforms': [
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
    };
  }

  Map<String, dynamic> get qry_ST_Health_EpicDiversification {
    return {'score_0_1': 0.55, 'status': 'ok', 'label_short': 'Healthy'};
  }

  Map<String, dynamic> get qry_ST_Health_TPBalance {
    return {'tp_balance': -0.25, 'tp_status': 'under'};
  }

  void FN_OpenChunkInfo(dynamic chunkPayload) {
    final chunkName = chunkPayload is Map
        ? (chunkPayload['name'] ?? 'Unnamed Chunk')
        : 'Unnamed Chunk';
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      chunkName,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Text(
                'Description placeholder: This chunk contains activities designed to help you master specific skills and achieve your learning goals.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 16.0),
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  'Level / Branch / Activity / Platform / Bundle / Successor / Fusion',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Coming soon'),
                      content: const Text(
                        'Add to Path feature will be available soon.',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
                child: const Text('Add to Path'),
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: CMP_Nav_TopBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _R2_SearchPanel(),
            FlexSizedBox(
              width: 394.0,
              height: 492.0,
              child: ST_R3TreeAreaBound(
                treeModel: qry_ST_TreeModel,
                expandedNodeIds: v_tree_expanded_node_ids,
                onToggle: (nodeId) {},
                onChunkTap: FN_OpenChunkInfo,
              ),
            ),
            R4Stats(
              currentPageIndex: v_radar_page_index,
              onPageChanged: (index) {
                setState(() {
                  v_radar_page_index = index;
                });
              },
            ),
            const R5Health(),
            _R6_Recommendations(),
          ],
        ),
      ),
    );
  }
}
