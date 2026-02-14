import 'package:flutter/material.dart';
import 'package:nowa_runtime/nowa_runtime.dart';
import 'package:leela_cloud_2026/components/chunks_container_quad.dart';

@NowaGenerated()
class SCR_ChunksContainerDemo extends StatefulWidget {
  @NowaGenerated({'loader': 'auto-constructor'})
  const SCR_ChunksContainerDemo({super.key});

  @override
  State<SCR_ChunksContainerDemo> createState() {
    return _SCR_ChunksContainerDemoState();
  }
}

@NowaGenerated()
class _SCR_ChunksContainerDemoState extends State<SCR_ChunksContainerDemo> {
  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
        color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
      ),
    );
  }

  void _showTapMessage(BuildContext context, String item) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Tapped: ${item}'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chunks Container Demo'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20.0),
              Text(
                'ChunksContainerQuad Widget',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 24.0),
              _buildSectionTitle(context, 'Empty Container'),
              const SizedBox(height: 8.0),
              const ChunksContainerQuad(
                strokeColor: Colors.purple,
                children: const [],
              ),
              const SizedBox(height: 32.0),
              _buildSectionTitle(context, 'Single Item'),
              const SizedBox(height: 8.0),
              ChunksContainerQuad(
                strokeColor: Colors.purple,
                children: [
                  ChunkIconItem(
                    iconPath: 'assets/icons/placeholder.png',
                    onTap: () => _showTapMessage(context, 'Item 1'),
                  ),
                ],
              ),
              const SizedBox(height: 32.0),
              _buildSectionTitle(context, 'Multiple Items (3)'),
              const SizedBox(height: 8.0),
              ChunksContainerQuad(
                strokeColor: Colors.purple,
                children: [
                  ChunkIconItem(
                    iconPath: 'assets/icons/placeholder.png',
                    onTap: () => _showTapMessage(context, 'Item 1'),
                  ),
                  ChunkIconItem(
                    iconPath: 'assets/icons/placeholder.png',
                    onTap: () => _showTapMessage(context, 'Item 2'),
                  ),
                  ChunkIconItem(
                    iconPath: 'assets/icons/placeholder.png',
                    onTap: () => _showTapMessage(context, 'Item 3'),
                  ),
                ],
              ),
              const SizedBox(height: 32.0),
              _buildSectionTitle(context, 'Many Items (5)'),
              const SizedBox(height: 8.0),
              ChunksContainerQuad(
                strokeColor: Colors.purple,
                children: List.generate(
                  5,
                  (index) => ChunkIconItem(
                    iconPath: 'assets/icons/placeholder.png',
                    onTap: () => _showTapMessage(context, 'Item ${index + 1}'),
                  ),
                ),
              ),
              const SizedBox(height: 32.0),
              _buildSectionTitle(context, 'Custom Stroke Color (Teal)'),
              const SizedBox(height: 8.0),
              ChunksContainerQuad(
                strokeColor: Colors.teal,
                children: List.generate(
                  3,
                  (index) => ChunkIconItem(
                    iconPath: 'assets/icons/placeholder.png',
                    onTap: () {},
                  ),
                ),
              ),
              const SizedBox(height: 32.0),
              _buildSectionTitle(context, 'With Icon Color Filter'),
              const SizedBox(height: 8.0),
              ChunksContainerQuad(
                strokeColor: Colors.deepOrange,
                iconColorFilter: const ColorFilter.mode(
                  Colors.deepOrange,
                  BlendMode.srcIn,
                ),
                children: List.generate(
                  3,
                  (index) => ChunkIconItem(
                    iconPath: 'assets/icons/placeholder.png',
                    onTap: () {},
                  ),
                ),
              ),
              const SizedBox(height: 32.0),
              _buildSectionTitle(
                context,
                'Custom Size (height: 100, itemSize: 64)',
              ),
              const SizedBox(height: 8.0),
              ChunksContainerQuad(
                strokeColor: Colors.indigo,
                height: 100.0,
                itemSize: 64.0,
                children: List.generate(
                  4,
                  (index) => ChunkIconItem(
                    iconPath: 'assets/icons/placeholder.png',
                    onTap: () {},
                  ),
                ),
              ),
              const SizedBox(height: 40.0),
            ],
          ),
        ),
      ),
    );
  }
}
