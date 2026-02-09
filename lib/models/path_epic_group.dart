import 'package:leela_cloud_2026/models/path_item_row.dart';
import 'package:nowa_runtime/nowa_runtime.dart';

@NowaGenerated()
class PathEpicGroup {
  PathEpicGroup({this.epicId = '', this.epicTitle = '', this.rows = const []});

  factory PathEpicGroup.fromJson(Map<String, dynamic> json) {
    return PathEpicGroup(
      epicId: json['epicId'] as String? ?? '',
      epicTitle: json['epicTitle'] as String? ?? '',
      rows:
          (json['rows'] as List<dynamic>?)
              ?.map((e) => PathItemRow.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  final String epicId;

  final String epicTitle;

  final List<PathItemRow> rows;

  Map<String, dynamic> toJson() {
    return {
      'epicId': epicId,
      'epicTitle': epicTitle,
      'rows': rows.map((e) => e.toJson()).toList(),
    };
  }
}
