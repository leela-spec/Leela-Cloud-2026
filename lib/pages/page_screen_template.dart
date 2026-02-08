import 'package:flutter/material.dart';
import 'package:nowa_runtime/nowa_runtime.dart';
import 'package:leela_cloud_2026/components/c_m_p_nav_top_bar.dart';

@NowaGenerated()
class PageScreenTemplate extends StatefulWidget {
  @NowaGenerated({'loader': 'auto-constructor'})
  const PageScreenTemplate({super.key});

  @override
  State<PageScreenTemplate> createState() {
    return _PageScreenTemplateState();
  }
}

@NowaGenerated()
class _PageScreenTemplateState extends State<PageScreenTemplate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CMP_Nav_TopBar(
              p_title: 'Template Screen',
              p_showSearch: true,
              p_showSettings: true,
              p_showSid: true,
              p_navOrder: const ['search', 'settings', 'home', 'sid'],
              p_onTapSearch: () {},
              p_onTapSettings: () {},
              p_onTapSid: (screenId) {},
              p_screenId: 'PageScreenTemplate',
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40.0),
                    Container(
                      padding: const EdgeInsets.all(32.0),
                      margin: const EdgeInsets.symmetric(horizontal: 16.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .surfaceContainerHighest
                            .withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(16.0),
                        border: Border.all(
                          color: Theme.of(
                            context,
                          ).colorScheme.outline.withValues(alpha: 0.2),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Content & Widgets and ..',
                          style: Theme.of(context).textTheme.headlineMedium
                              ?.copyWith(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurface.withValues(alpha: 0.5),
                                fontWeight: FontWeight.w300,
                              ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
