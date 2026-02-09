import 'package:flutter/material.dart';
import 'package:nowa_runtime/nowa_runtime.dart';
import 'package:leela_cloud_2026/components/c_m_p_nav_top_bar.dart';
import 'package:leela_cloud_2026/components/chunk_cube.dart';

@NowaGenerated()
class SCR_ChunkCubeGrid extends StatefulWidget {
  @NowaGenerated({'loader': 'auto-constructor'})
  const SCR_ChunkCubeGrid({super.key});

  @override
  State<SCR_ChunkCubeGrid> createState() {
    return _SCR_ChunkCubeGridState();
  }
}

@NowaGenerated()
class _SCR_ChunkCubeGridState extends State<SCR_ChunkCubeGrid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CMP_Nav_TopBar(
              p_title: 'Chunk Cube Grid',
              p_showSearch: true,
              p_showSettings: true,
              p_showSid: true,
              p_navOrder: const ['search', 'settings', 'home', 'sid'],
              p_onTapSearch: () {},
              p_onTapSettings: () {},
              p_onTapSid: (screenId) {},
              p_screenId: 'ChunkCubeGrid',
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        'Chunk Cube Collection',
                        style: Theme.of(context).textTheme.headlineLarge
                            ?.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    const SizedBox(height: 32.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 3,
                        mainAxisSpacing: 16.0,
                        crossAxisSpacing: 16.0,
                        children: [
                          ChunkCube(
                            icon: Icons.star,
                            cubeColor: Theme.of(context).colorScheme.primary,
                            onTap: () {},
                          ),
                          ChunkCube(
                            icon: Icons.favorite,
                            cubeColor: Theme.of(context).colorScheme.secondary,
                            onTap: () {},
                          ),
                          ChunkCube(
                            icon: Icons.flash_on,
                            cubeColor: Theme.of(context).colorScheme.tertiary,
                            onTap: () {},
                          ),
                          ChunkCube(
                            icon: Icons.thumb_up,
                            cubeColor: Theme.of(context).colorScheme.primary,
                            onTap: () {},
                          ),
                          ChunkCube(
                            icon: Icons.rocket_launch,
                            cubeColor: Theme.of(context).colorScheme.secondary,
                            onTap: () {},
                          ),
                          ChunkCube(
                            icon: Icons.celebration,
                            cubeColor: Theme.of(context).colorScheme.tertiary,
                            onTap: () {},
                          ),
                          ChunkCube(
                            icon: Icons.emoji_events,
                            cubeColor: Theme.of(context).colorScheme.primary,
                            onTap: () {},
                          ),
                          ChunkCube(
                            icon: Icons.auto_awesome,
                            cubeColor: Theme.of(context).colorScheme.secondary,
                            onTap: () {},
                          ),
                          ChunkCube(
                            icon: Icons.diamond,
                            cubeColor: Theme.of(context).colorScheme.tertiary,
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40.0),
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
