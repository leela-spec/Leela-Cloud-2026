import 'package:nowa_runtime/nowa_runtime.dart';

@NowaGenerated()
class UpcomingRow {
  const UpcomingRow({
    required this.id,
    required this.startLabel,
    required this.name,
    required this.timeUntilLabel,
  });

  factory UpcomingRow.fromJson(Map<String, dynamic> json) {
    return UpcomingRow(
      id: json['id'] as String? ?? '',
      startLabel: json['startLabel'] as String? ?? '',
      name: json['name'] as String? ?? '',
      timeUntilLabel: json['timeUntilLabel'] as String? ?? '',
    );
  }

  final String id;

  final String startLabel;

  final String name;

  final String timeUntilLabel;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'startLabel': startLabel,
      'name': name,
      'timeUntilLabel': timeUntilLabel,
    };
  }
}
