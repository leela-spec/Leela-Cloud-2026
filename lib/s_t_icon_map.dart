import 'package:nowa_runtime/nowa_runtime.dart';
import 'package:flutter/material.dart';

@NowaGenerated()
class STIconMap {
  STIconMap._();

  /// Hierarchy level icons
  static const Map<String, IconData> hierarchy = {
    'epic': Icons.grid_3x3,
    'block': Icons.apps,
    'chunk': Icons.view_in_ar,
  };

  /// Branch type icons (P/M/C/R)
  static const Map<String, IconData> branch = {
    'P': Icons.fitness_center,
    'M': Icons.psychology,
    'C': Icons.handyman,
    'R': Icons.self_improvement,
  };

  /// Activity type icons
  static const Map<String, IconData> activityType = {
    'listening': Icons.headphones,
    'reading': Icons.menu_book,
    'watching': Icons.ondemand_video,
    'vocal': Icons.record_voice_over,
    'movement': Icons.directions_run,
    'process': Icons.checklist,
    'testing': Icons.quiz,
    'meditate': Icons.self_improvement,
    'social': Icons.groups,
    'creative': Icons.brush,
    'relaxing': Icons.weekend,
    'multi': Icons.dashboard_customize,
    'entertainment': Icons.celebration,
  };

  /// Media type / Platform icons
  static const Map<String, IconData> mediaType = {
    'app': Icons.apps,
    'website': Icons.public,
    'video': Icons.ondemand_video,
    'book': Icons.menu_book,
    'audiobook': Icons.headphones,
    'music': Icons.music_note,
    'online_course': Icons.school,
    'offline_course': Icons.local_library,
    'exercise': Icons.sports_gymnastics,
    'other': Icons.more_horiz,
  };

  /// Flag icons
  static const Map<String, IconData> flags = {
    'bundle': Icons.layers,
    'successor': Icons.arrow_right_alt,
    'fusion': Icons.call_merge,
  };
}
