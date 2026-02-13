import 'package:flutter/material.dart';
import 'package:nowa_runtime/nowa_runtime.dart';
import 'package:leela_cloud_2026/integrations/supabase_service.dart';
import 'package:leela_cloud_2026/s_t_icon_map.dart';
import 'package:provider/provider.dart';

@NowaGenerated()
class GS_SkillTree extends ChangeNotifier {
  List<Map<String, dynamic>> _treeModel = [];

  List<Map<String, dynamic>> get treeModel {
    return _treeModel;
  }

  List<String> _expandedNodeIds = [];

  List<String> get expandedNodeIds {
    return _expandedNodeIds;
  }

  bool _isLoading = false;

  bool get isLoading {
    return _isLoading;
  }

  String? _error;

  String? get error {
    return _error;
  }

  void toggleNode(String nodeId) {
    if (_expandedNodeIds.contains(nodeId)) {
      _expandedNodeIds.remove(nodeId);
    } else {
      _expandedNodeIds.add(nodeId);
    }
    notifyListeners();
  }

  Future<void> loadTree(String epicId) async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    try {
      final List<Map<String, dynamic>> flatRows = await SupabaseService()
          .q_skill_tree_nodes(epicId);
      _treeModel = buildSkillTreeModel(flatRows);
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  List<Map<String, dynamic>> buildSkillTreeModel(
    List<Map<String, dynamic>> rows,
  ) {
    final Map<String, Map<String, dynamic>> nodeMap = {};
    final List<Map<String, dynamic>> roots = [];
    for (final row in rows) {
      final nodeId = row['node_id'].toString() ?? '';
      if (nodeId.isEmpty) {
        continue;
      }
      final node = {
        'id': nodeId,
        'type': row['node_type'],
        'name': row['name'] ?? 'Unknown',
        'parent_id': row['parent_id'],
        'children': <Map<String, dynamic>>[],
        'sort_order': row['sort_order'] ?? 0,
        'node_sort_order': row['node_sort_order'] ?? 0,
        'lvl': row['lvl'],
        'payload': row,
      };
      if (row['node_type'] == 'chunk') {
        node['symbols'] = buildSymbols(row);
      }
      nodeMap[nodeId] = node;
    }
    for (final node in nodeMap.values) {
      final parentId = node['parent_id'].toString();
      if (parentId == null || !nodeMap.containsKey(parentId)) {
        roots.add(node);
      } else {
        final parentNode = nodeMap[parentId];
        if (parentNode != null) {
          (parentNode['children'] as List<Map<String, dynamic>>).add(node);
        } else {
          roots.add(node);
        }
      }
    }
    return roots;
  }

  List<dynamic> buildSymbols(Map row) {
    final List<dynamic> symbols = [];
    if (row['lvl'] != null) {
      symbols.add(row['lvl']);
    }
    final String? branch = row['branch'].toString().toUpperCase();
    if (branch != null && STIconMap.branch.containsKey(branch)) {
      symbols.add(STIconMap.branch[branch]);
    }
    final String? activities = row['activity_types'].toString().toLowerCase();
    if (activities != null) {
      STIconMap.activityType.forEach((key, icon) {
        if (activities.contains(key)) {
          symbols.add(icon);
        }
      });
    }
    final String? media = row['media_type'].toString().toLowerCase();
    if (media != null && STIconMap.mediaType.containsKey(media)) {
      symbols.add(STIconMap.mediaType[media]);
    }
    if (row['has_bundle'] == true) {
      symbols.add(STIconMap.flags['bundle']);
    }
    if (row['has_successor'] == true) {
      symbols.add(STIconMap.flags['successor']);
    }
    if (row['has_fusion'] == true) {
      symbols.add(STIconMap.flags['fusion']);
    }
    return symbols;
  }

  static GS_SkillTree of(BuildContext context, {bool listen = true}) {
    return Provider.of<GS_SkillTree>(context, listen: listen);
  }
}
