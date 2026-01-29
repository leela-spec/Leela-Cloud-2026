import 'package:flutter/material.dart';
import 'package:nowa_runtime/nowa_runtime.dart';
import 'package:leela_cloud_2026/globals/g_s_data.dart';
import 'package:leela_cloud_2026/components/c_m_p_nav_top_bar.dart';

@NowaGenerated()
class SCR_Home_Today extends StatefulWidget {
  @NowaGenerated({'loader': 'auto-constructor'})
  const SCR_Home_Today({super.key});

  @override
  State<SCR_Home_Today> createState() {
    return _SCR_Home_TodayState();
  }
}

@NowaGenerated()
class _SCR_Home_TodayState extends State<SCR_Home_Today> {
  bool v_isUpcomingExpanded = false;

  bool v_isLoading = false;

  bool v_hasError = false;

  int v_activeHeroIndex = 0;

  String v_homeOrbTab = 'st';

  @override
  void initState() {
    super.initState();
    GS_Data.of(context).fn_seedHomeMockData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CMP_Nav_TopBar(
              p_title: 'Home',
              p_showSearch: true,
              p_showSettings: true,
              p_showSid: true,
              p_navOrder: const ['search', 'settings', 'home', 'sid'],
              p_onTapSearch: () {},
              p_onTapSettings: () {},
              p_onTapSid: (screenId) {},
              p_screenId: 'SCR_Home_Today',
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 16.0),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: const Text('Body Section 1'),
                    ),
                    const SizedBox(height: 16.0),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: const Text('Body Section 2'),
                    ),
                    const SizedBox(height: 16.0),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: const Text('Body Section 3'),
                    ),
                    const SizedBox(height: 16.0),
                  ],
                ),
              ),
            ),
            Container(
              height: 60.0,
              padding: const EdgeInsets.all(16.0),
              color: Theme.of(context).colorScheme.surface,
              child: const Center(child: Text('CMP_Nav_BottomBar Placeholder')),
            ),
          ],
        ),
      ),
    );
  }
}
