import 'package:flutter/material.dart';
import 'package:nowa_runtime/nowa_runtime.dart';
import 'package:provider/provider.dart';

import '../integrations/supabase_service.dart';

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

  Future<void> loadTree() async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    try {
      final List<Map<String, dynamic>> flatRows = await SupabaseService()
          .qSkillTreeNodeList();
      final Map<String, Map<String, dynamic>> nodeMap = {};
      final List<Map<String, dynamic>> roots = [];
      for (final row in flatRows) {
        final nodeId = row['node_id']?.toString() ?? '';
        if (nodeId.isEmpty) continue;
        final node = {
          'id': nodeId,
          'type': row['node_type'],
          'name': row['name'] ?? 'Unknown',
          'parent_id': row['parent_id'],
          'children': <Map<String, dynamic>>[],
          'sort_order': row['sort_order'] ?? 0,
          'node_sort_order': row['node_sort_order'] ?? 0,
          'lvl': row['lvl'],
        };
        if (row['node_type'] == 'chunk') {
          node['symbols'] = buildSymbols(row);
          node['payload'] = row;
        }
        nodeMap[nodeId] = node;
      }
      for (final node in nodeMap.values) {
        final parentId = node['parent_id']?.toString();
        if (parentId == null || !nodeMap.containsKey(parentId)) {
          roots.add(node);
        } else {
          (nodeMap[parentId]!['children'] as List<Map<String, dynamic>>).add(
            node,
          );
        }
      }
      void sortNode(Map<String, dynamic> node) {
        final children = node['children'] as List<Map<String, dynamic>>;
        if (children.isEmpty) return;
        children.sort((a, b) {
          if (a['type'] == 'block' && b['type'] == 'block') {
            return (a['sort_order'] as int).compareTo(b['sort_order'] as int);
          }
          if (a['type'] == 'chunk' && b['type'] == 'chunk') {
            final aLvl = a['lvl'] as int?;
            final bLvl = b['lvl'] as int?;
            if (aLvl != bLvl) {
              if (aLvl == null) return 1;
              if (bLvl == null) return -1;
              return aLvl.compareTo(bLvl);
            }
            return (a['node_sort_order'] as int).compareTo(
              b['node_sort_order'] as int,
            );
          }
          return a['type'] == 'block' ? -1 : 1;
        });
        for (final child in children) {
          sortNode(child);
        }
      }

      for (final root in roots) {
        sortNode(root);
      }
      _treeModel = roots;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void toggleNode(String nodeId) {
    if (_expandedNodeIds.contains(nodeId)) {
      _expandedNodeIds.remove(nodeId);
    } else {
      _expandedNodeIds.add(nodeId);
    }
    notifyListeners();
  }

  List<dynamic> buildSymbols(Map row) {
    final List<dynamic> symbols = [];
    if (row['lvl'] != null) {
      if (row['lvl'] is int) {
        symbols.add(row['lvl']);
      } else {
        final val = int.tryParse(row['lvl'].toString());
        if (val != null) {
          symbols.add(val);
        }
      }
    }
    if (row['has_bundle'] == true) {
      symbols.add(Icons.layers);
    }
    if (row['has_fusion'] == true) {
      symbols.add(Icons.auto_awesome);
    }
    if (row['has_successor'] == true) {
      symbols.add(Icons.arrow_forward);
    }
    final media = row['media_type'].toString().toLowerCase();
    if (media == 'video') {
      symbols.add(Icons.play_circle);
    } else if (media == 'article' || media == 'text') {
      symbols.add(Icons.article);
    }
    final activity = row['activity_types'].toString().toLowerCase();
    if (activity != null && activity.contains('exercise')) {
      symbols.add(Icons.fitness_center);
    }
    return symbols;
  }

  static GS_SkillTree of(BuildContext context, {bool listen = true}) {
    return Provider.of<GS_SkillTree>(context, listen: listen);
  }
}
