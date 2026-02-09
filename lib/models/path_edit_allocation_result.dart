import 'package:nowa_runtime/nowa_runtime.dart';

@NowaGenerated()
class PathEditAllocationResult {
  PathEditAllocationResult({
    this.pathRowId = '',
    this.tpPlannedMin = 0,
    this.priorityUi = 0,
  });

  factory PathEditAllocationResult.fromJson(Map<String, dynamic> json) {
    return PathEditAllocationResult(
      pathRowId: json['pathRowId'] as String? ?? '',
      tpPlannedMin: json['tpPlannedMin'] as int? ?? 0,
      priorityUi: json['priorityUi'] as int? ?? 0,
    );
  }

  final String pathRowId;

  final int tpPlannedMin;

  final int priorityUi;

  Map<String, dynamic> toJson() {
    return {
      'pathRowId': pathRowId,
      'tpPlannedMin': tpPlannedMin,
      'priorityUi': priorityUi,
    };
  }
}
