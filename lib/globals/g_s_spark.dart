import 'package:flutter/material.dart';
import 'package:leela_cloud_2026/models/scope_selection_result.dart';
import 'package:nowa_runtime/nowa_runtime.dart';
import 'package:provider/provider.dart';

@NowaGenerated()
class GS_Spark extends ChangeNotifier {
  GS_Spark();

  factory GS_Spark.of(BuildContext context, {bool listen = false}) {
    return Provider.of<GS_Spark>(context, listen: listen);
  }

  ScopeSelectionResult? g_scope;

  int g_maxDurationSeconds = -1;

  void setScope(ScopeSelectionResult? scope) {
    g_scope = scope;
    notifyListeners();
  }

  void setMaxDuration(int duration) {
    g_maxDurationSeconds = duration;
    notifyListeners();
  }
}
