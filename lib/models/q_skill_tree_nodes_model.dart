import 'package:nowa_runtime/nowa_runtime.dart';

@NowaGenerated()
class QSkillTreeNodesModel {
  @NowaGenerated({'loader': 'auto-constructor'})
  const QSkillTreeNodesModel({
    this.nodeId,
    this.parentId,
    this.epicId,
    this.nodeType,
    this.name,
    this.sortOrder,
    this.nodeSortOrder,
    this.chunkId,
    this.nodeKey,
    this.branch,
    this.activityTypes,
    this.mediaType,
    this.lvl,
    this.hasBundle,
    this.hasSuccessor,
    this.hasFusion,
  });

  @NowaGenerated({'loader': 'auto-from-json'})
  factory QSkillTreeNodesModel.fromJson({required Map<String, dynamic> json}) {
    return QSkillTreeNodesModel(
      nodeId: json['node_id'],
      parentId: json['parent_id'],
      epicId: json['epic_id'],
      nodeType: json['node_type'],
      name: json['name'],
      sortOrder: json['sort_order'],
      nodeSortOrder: json['node_sort_order'],
      chunkId: json['chunk_id'],
      nodeKey: json['node_key'],
      branch: json['branch'],
      activityTypes: json['activity_types'],
      mediaType: json['media_type'],
      lvl: json['lvl'],
      hasBundle: json['has_bundle'],
      hasSuccessor: json['has_successor'],
      hasFusion: json['has_fusion'],
    );
  }

  @NowaGenerated({'key': 'node_id'})
  final String? nodeId;

  @NowaGenerated({'key': 'parent_id'})
  final String? parentId;

  @NowaGenerated({'key': 'epic_id'})
  final String? epicId;

  @NowaGenerated({'key': 'node_type'})
  final String? nodeType;

  final String? name;

  @NowaGenerated({'key': 'sort_order'})
  final int? sortOrder;

  @NowaGenerated({'key': 'node_sort_order'})
  final int? nodeSortOrder;

  @NowaGenerated({'key': 'chunk_id'})
  final dynamic chunkId;

  @NowaGenerated({'key': 'node_key'})
  final dynamic nodeKey;

  final dynamic branch;

  @NowaGenerated({'key': 'activity_types'})
  final dynamic activityTypes;

  @NowaGenerated({'key': 'media_type'})
  final dynamic mediaType;

  final dynamic lvl;

  @NowaGenerated({'key': 'has_bundle'})
  final bool? hasBundle;

  @NowaGenerated({'key': 'has_successor'})
  final bool? hasSuccessor;

  @NowaGenerated({'key': 'has_fusion'})
  final bool? hasFusion;

  @NowaGenerated({'loader': 'auto-to-json'})
  Map<String, dynamic> toJson() {
    return {
      'node_id': nodeId,
      'parent_id': parentId,
      'epic_id': epicId,
      'node_type': nodeType,
      'name': name,
      'sort_order': sortOrder,
      'node_sort_order': nodeSortOrder,
      'chunk_id': chunkId,
      'node_key': nodeKey,
      'branch': branch,
      'activity_types': activityTypes,
      'media_type': mediaType,
      'lvl': lvl,
      'has_bundle': hasBundle,
      'has_successor': hasSuccessor,
      'has_fusion': hasFusion,
    };
  }
}
