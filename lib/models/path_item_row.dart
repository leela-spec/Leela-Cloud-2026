import 'package:nowa_runtime/nowa_runtime.dart';

@NowaGenerated()
class PathItemRow {
  PathItemRow({
    this.id = '',
    this.title = '',
    this.branchCode = '',
    this.tpPlannedMin = 0,
    this.priorityUi = 0,
  });

  factory PathItemRow.fromJson(Map<String, dynamic> json) {
    return PathItemRow(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      branchCode: json['branchCode'] as String? ?? '',
      tpPlannedMin: (json['tpPlannedMin'] is int)
          ? json['tpPlannedMin'] as int
          : (int.tryParse((json['tpPlannedMin'] ?? '').toString()) ?? 0),
      priorityUi: (json['priorityUi'] is int)
          ? json['priorityUi'] as int
          : (int.tryParse((json['priorityUi'] ?? '').toString()) ?? 0),
    );
  }

  final String id;

  final String title;

  final String branchCode;

  final int tpPlannedMin;

  final int priorityUi;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'branchCode': branchCode,
      'tpPlannedMin': tpPlannedMin,
      'priorityUi': priorityUi,
    };
  }
}
