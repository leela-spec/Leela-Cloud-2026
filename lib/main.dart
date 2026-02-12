import 'package:shared_preferences/shared_preferences.dart';
import 'package:leela_cloud_2026/integrations/supabase_service.dart';
import 'package:nowa_runtime/nowa_runtime.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:leela_cloud_2026/globals/app_state.dart';
import 'package:leela_cloud_2026/globals/g_s_data.dart';
import 'package:leela_cloud_2026/globals/g_s_spark.dart';
import 'package:leela_cloud_2026/globals/g_s_skill_tree.dart';
import 'package:leela_cloud_2026/pages/lab_playground.dart';
import 'package:leela_cloud_2026/pages/s_c_r_home_today.dart';
import 'package:leela_cloud_2026/pages/leela_home.dart';

@NowaGenerated()
late final SharedPreferences sharedPrefs;

@NowaGenerated()
main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPrefs = await SharedPreferences.getInstance();
  await SupabaseService().initialize();
  runApp(const MyApp());
}

@NowaGenerated({'visibleInNowa': false})
class MyApp extends StatelessWidget {
  @NowaGenerated({'loader': 'auto-constructor'})
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppState>(create: (context) => AppState()),
        ChangeNotifierProvider<GS_Data>(create: (context) => GS_Data()),
        ChangeNotifierProvider<GS_Spark>(create: (context) => GS_Spark()),
        ChangeNotifierProvider<GS_SkillTree>(
          create: (context) => GS_SkillTree(),
        ),
      ],
      builder: (context, child) => MaterialApp(
        theme: AppState.of(context).theme,
        home: const LabPlayground(),
        routes: {
          'home': (context) => const SCR_Home_Today(),
          'LeelaHome': (context) => const LeelaHome(),
          'devHome': (context) => const LabPlayground(),
        },
      ),
    );
  }
}
