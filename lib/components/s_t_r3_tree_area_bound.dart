import 'package:flutter/material.dart';
import 'package:nowa_runtime/nowa_runtime.dart';
import 'package:leela_cloud_2026/components/w_g_t_s_t_tree_view.dart';

@NowaGenerated()
class ST_R3TreeAreaBound extends StatelessWidget {
  @NowaGenerated({'loader': 'auto-constructor'})
  const ST_R3TreeAreaBound({
    super.key,
    required this.treeModel,
    required this.expandedNodeIds,
    this.onToggle,
    this.onChunkTap,
  });

  final List<Map<String, dynamic>> treeModel;

  final List<String> expandedNodeIds;

  final Function(String nodeId)? onToggle;

  final Function(dynamic chunkPayload)? onChunkTap;

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
                treeModel: treeModel,
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
