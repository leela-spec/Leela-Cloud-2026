import 'package:nowa_runtime/nowa_runtime.dart';

@NowaGenerated()
class ScopeSelectionResult {
  const ScopeSelectionResult({
    required this.id,
    required this.epicIds,
    required this.blockIds,
    required this.label,
  });

  factory ScopeSelectionResult.fromJson(Map<String, dynamic> json) {
    return ScopeSelectionResult(
      id: json['id'] as String? ?? '',
      epicIds: (json['epicIds'] as List?)?.cast<String>() ?? [],
      blockIds: (json['blockIds'] as List?)?.cast<String>() ?? [],
      label: json['label'] as String? ?? '',
    );
  }

  final String id;

  final List<String> epicIds;

  final List<String> blockIds;

  final String label;

  Map<String, dynamic> toJson() {
    return {'id': id, 'epicIds': epicIds, 'blockIds': blockIds, 'label': label};
  }
}
