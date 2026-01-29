import 'package:flutter/material.dart';
import 'package:nowa_runtime/nowa_runtime.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 60.0,
              padding: const EdgeInsets.all(16.0),
              color: Theme.of(context).colorScheme.surface,
              child: const Center(child: Text('CMP_Nav_TopBar Placeholder')),
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
