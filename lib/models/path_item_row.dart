import 'package:nowa_runtime/nowa_runtime.dart';

@NowaGenerated()
class PathItemRow {
  PathItemRow({this.id = '', this.title = ''});

  factory PathItemRow.fromJson(Map<String, dynamic> json) {
    return PathItemRow(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
    );
  }

  final String id;

  final String title;

  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title};
  }
}
