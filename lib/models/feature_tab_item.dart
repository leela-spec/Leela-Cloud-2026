import 'package:nowa_runtime/nowa_runtime.dart';

@NowaGenerated()
class FeatureTabItem {
  const FeatureTabItem({
    required this.id,
    required this.key,
    required this.label,
    required this.route,
  });

  factory FeatureTabItem.fromJson(Map<String, dynamic> json) {
    return FeatureTabItem(
      id: json['id'] as String? ?? '',
      key: json['key'] as String? ?? '',
      label: json['label'] as String? ?? '',
      route: json['route'] as String? ?? '',
    );
  }

  final String id;

  final String key;

  final String label;

  final String route;

  Map<String, dynamic> toJson() {
    return {'id': id, 'key': key, 'label': label, 'route': route};
  }
}
