import 'package:nowa_runtime/nowa_runtime.dart';

@NowaGenerated()
class HeroItem {
  const HeroItem({
    required this.id,
    required this.chunkId,
    required this.title,
    this.subtitle,
    this.platform,
    this.epicBlock,
    this.tp,
    this.xp,
    this.bp,
    this.symbolKey,
  });

  factory HeroItem.fromJson(Map<String, dynamic> json) {
    return HeroItem(
      id: json['id'] as String? ?? '',
      chunkId: json['chunkId'] as String? ?? '',
      title: json['title'] as String? ?? '',
      subtitle: json['subtitle'] as String?,
      platform: json['platform'] as String?,
      epicBlock: json['epicBlock'] as String?,
      tp: json['tp'] as int?,
      xp: json['xp'] as int?,
      bp: json['bp'] as int?,
      symbolKey: json['symbolKey'] as String?,
    );
  }

  final String id;

  final String chunkId;

  final String title;

  final String? subtitle;

  final String? platform;

  final String? epicBlock;

  final int? tp;

  final int? xp;

  final int? bp;

  final String? symbolKey;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'chunkId': chunkId,
      'title': title,
      'subtitle': subtitle,
      'platform': platform,
      'epicBlock': epicBlock,
      'tp': tp,
      'xp': xp,
      'bp': bp,
      'symbolKey': symbolKey,
    };
  }
}
