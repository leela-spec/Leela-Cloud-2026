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

              // Demo 1: Empty container
              _buildSectionTitle(context, 'Empty Container'),
              const SizedBox(height: 8.0),
              const ChunksContainerQuad(
                children: [],
                strokeColor: Colors.purple,
              ),
              const SizedBox(height: 32.0),

              // Demo 2: Single item
              _buildSectionTitle(context, 'Single Item'),
              const SizedBox(height: 8.0),
              ChunksContainerQuad(
                children: [
                  ChunkIconItem(
                    iconPath: 'assets/icons/placeholder.png',
                    onTap: () => _showTapMessage(context, 'Item 1'),
                  ),
                ],
                strokeColor: Colors.purple,
              ),
              const SizedBox(height: 32.0),

              // Demo 3: Multiple items (3)
              _buildSectionTitle(context, 'Multiple Items (3)'),
              const SizedBox(height: 8.0),
              ChunksContainerQuad(
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
                strokeColor: Colors.purple,
              ),
              const SizedBox(height: 32.0),

              // Demo 4: Many items (5)
              _buildSectionTitle(context, 'Many Items (5)'),
              const SizedBox(height: 8.0),
              ChunksContainerQuad(
                children: List.generate(
                  5,
                  (index) => ChunkIconItem(
                    iconPath: 'assets/icons/placeholder.png',
                    onTap: () => _showTapMessage(context, 'Item ${index + 1}'),
                  ),
                ),
                strokeColor: Colors.purple,
              ),
              const SizedBox(height: 32.0),

              // Demo 5: Custom colors (Teal)
              _buildSectionTitle(context, 'Custom Stroke Color (Teal)'),
              const SizedBox(height: 8.0),
              ChunksContainerQuad(
                children: List.generate(
                  3,
                  (index) => ChunkIconItem(
                    iconPath: 'assets/icons/placeholder.png',
                  ),
                ),
                strokeColor: Colors.teal,
              ),
              const SizedBox(height: 32.0),

              // Demo 6: With icon color filter
              _buildSectionTitle(context, 'With Icon Color Filter'),
              const SizedBox(height: 8.0),
              ChunksContainerQuad(
                children: List.generate(
                  3,
                  (index) => ChunkIconItem(
                    iconPath: 'assets/icons/placeholder.png',
                  ),
                ),
                strokeColor: Colors.deepOrange,
                iconColorFilter: const ColorFilter.mode(
                  Colors.deepOrange,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(height: 32.0),

              // Demo 7: Custom sizing
              _buildSectionTitle(context, 'Custom Size (height: 100, itemSize: 64)'),
              const SizedBox(height: 8.0),
              ChunksContainerQuad(
                children: List.generate(
                  4,
                  (index) => ChunkIconItem(
                    iconPath: 'assets/icons/placeholder.png',
                  ),
                ),
                strokeColor: Colors.indigo,
                height: 100.0,
                itemSize: 64.0,
              ),
              const SizedBox(height: 40.0),
            ],
          ),
        ),
      ),
    );
  }

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
        content: Text('Tapped: $item'),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
