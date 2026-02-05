import 'package:flutter/material.dart';
import 'package:nowa_runtime/nowa_runtime.dart';
import 'package:leela_cloud_2026/components/s_t_chunk_row.dart';

@NowaGenerated()
class WGT_ST_TreeView extends StatelessWidget {
  @NowaGenerated({'loader': 'auto-constructor'})
  const WGT_ST_TreeView({
    super.key,
    this.treeModel,
    required this.expandedNodeIds,
    this.onToggle,
    this.onChunkTap,
  });

  final dynamic treeModel;

  final List<String> expandedNodeIds;

  final Function(String nodeId)? onToggle;

  final Function(dynamic chunkPayload)? onChunkTap;

  @override
  Widget build(BuildContext context) {
    if (treeModel == null ||
        (treeModel is Map && treeModel.isEmpty) ||
        (treeModel is List && treeModel.isEmpty)) {
      return Center(
        child: Text(
          'No tree data',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ),
      );
    }
    final List<dynamic> flatList = treeModel is List
        ? treeModel
        : (treeModel['nodes'] ?? []);
    return ListView.builder(
      itemCount: flatList.length,
      itemBuilder: (context, index) {
        final node = flatList[index];
        return ST_ChunkRow(node: node, onTap: () => onChunkTap?.call(node));
      },
    );
  }
}
