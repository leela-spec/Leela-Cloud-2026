import 'package:nowa_runtime/nowa_runtime.dart';

@NowaGenerated()
class DonutMetric {
  const DonutMetric({
    required this.id,
    required this.label,
    required this.realized,
    required this.open,
    required this.planned,
    required this.unit,
  });

  factory DonutMetric.fromJson(Map<String, dynamic> json) {
    return DonutMetric(
      id: json['id'] as String? ?? '',
      label: json['label'] as String? ?? '',
      realized: json['realized'] as int? ?? 0,
      open: json['open'] as int? ?? 0,
      planned: json['planned'] as int? ?? 0,
      unit: json['unit'] as String? ?? '',
    );
  }

  final String id;

  final String label;

  final int realized;

  final int open;

  final int planned;

  final String unit;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'label': label,
      'realized': realized,
      'open': open,
      'planned': planned,
      'unit': unit,
    };
  }
}
