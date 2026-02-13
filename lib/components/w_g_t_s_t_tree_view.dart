import 'package:flutter/material.dart';
import 'package:nowa_runtime/nowa_runtime.dart';
import 'package:leela_cloud_2026/components/s_t_chunk_row.dart';

@NowaGenerated()
class WGT_ST_TreeView extends StatelessWidget {
  @NowaGenerated({'loader': 'auto-constructor'})
  const WGT_ST_TreeView({
    this.treeModel,
    required this.expandedNodeIds,
    this.onToggle,
    this.onChunkTap,
    super.key,
  });

  final dynamic treeModel;

  final List<String> expandedNodeIds;

  final Function(String nodeId)? onToggle;

  final Function(dynamic chunkPayload)? onChunkTap;

  @override
  Widget build(BuildContext context) {
    if (treeModel == null ||
        (treeModel is List && (treeModel as List).isEmpty)) {
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
    final List<dynamic> roots = treeModel as List<dynamic>;
    return ListView(
      children: roots.map((node) => _buildNode(context, node, 0)).toList(),
    );
  }

  Widget _buildNode(
    BuildContext context,
    Map<String, dynamic> node,
    int depth,
  ) {
    final String nodeId = node['id'] ?? '';
    final String type = node['type'] ?? 'chunk';
    final String name = node['name'] ?? 'Unnamed';
    final List<dynamic> children = node['children'] ?? [];
    final bool isExpanded = expandedNodeIds.contains(nodeId);
    final bool hasChildren = children.isNotEmpty;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _renderRow(context, node, depth, isExpanded, hasChildren),
        if (isExpanded && hasChildren)
          ...children
              .map((child) => _buildNode(context, child, depth + 1))
              .toList(),
      ],
    );
  }

  Widget _renderRow(
    BuildContext context,
    Map<String, dynamic> node,
    int depth,
    bool isExpanded,
    bool hasChildren,
  ) {
    final String type = node['type'] ?? 'chunk';
    final String name = node['name'] ?? 'Unnamed';
    final String nodeId = node['id'] ?? '';
    if (type == 'chunk') {
      return Padding(
        padding: EdgeInsets.only(left: depth * 16.0),
        child: ST_ChunkRow(
          node: node,
          onTap: () => onChunkTap?.call(node['payload']),
        ),
      );
    }
    final IconData icon = type == 'epic' ? Icons.grid_3x3 : Icons.apps;
    final double fontSize = type == 'epic' ? 18.0 : 16.0;
    final FontWeight fontWeight = type == 'epic'
        ? FontWeight.bold
        : FontWeight.w600;
    return InkWell(
      onTap: () => onToggle?.call(nodeId),
      child: Padding(
        padding: EdgeInsets.fromLTRB(16.0 + (depth * 16.0), 12.0, 16.0, 12.0),
        child: Row(
          children: [
            Icon(
              isExpanded
                  ? Icons.keyboard_arrow_down
                  : Icons.keyboard_arrow_right,
              size: 20.0,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            const SizedBox(width: 8.0),
            Icon(
              icon,
              size: 20.0,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(width: 12.0),
            Expanded(
              child: Text(
                name,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
