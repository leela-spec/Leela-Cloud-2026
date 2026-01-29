import 'package:nowa_runtime/nowa_runtime.dart';

@NowaGenerated()
class RecommendationChunk {
  const RecommendationChunk({
    required this.chunkId,
    required this.chunkTitle,
    this.platformName,
    required this.sequenceTypeLabel,
    this.epicBlockLabel,
    this.rewardTP,
    this.rewardXP,
    this.rewardBP,
    this.symbolKey,
  });

  factory RecommendationChunk.fromJson(Map<String, dynamic> json) {
    return RecommendationChunk(
      chunkId: json['chunkId'] as String? ?? '',
      chunkTitle: json['chunkTitle'] as String? ?? '',
      platformName: json['platformName'] as String?,
      sequenceTypeLabel: json['sequenceTypeLabel'] as String? ?? '',
      epicBlockLabel: json['epicBlockLabel'] as String?,
      rewardTP: json['rewardTP'] as int?,
      rewardXP: json['rewardXP'] as int?,
      rewardBP: json['rewardBP'] as int?,
      symbolKey: json['symbolKey'] as String?,
    );
  }

  final String chunkId;

  final String chunkTitle;

  final String? platformName;

  final String sequenceTypeLabel;

  final String? epicBlockLabel;

  final int? rewardTP;

  final int? rewardXP;

  final int? rewardBP;

  final String? symbolKey;

  Map<String, dynamic> toJson() {
    return {
      'chunkId': chunkId,
      'chunkTitle': chunkTitle,
      'platformName': platformName,
      'sequenceTypeLabel': sequenceTypeLabel,
      'epicBlockLabel': epicBlockLabel,
      'rewardTP': rewardTP,
      'rewardXP': rewardXP,
      'rewardBP': rewardBP,
      'symbolKey': symbolKey,
    };
  }
}
