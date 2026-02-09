import 'package:flutter/material.dart';
import 'package:leela_cloud_2026/chunk_item.dart';
import 'package:nowa_runtime/nowa_runtime.dart';
import 'package:leela_cloud_2026/components/chunk_cube.dart';

@NowaGenerated()
class ChunkInfoCard extends StatelessWidget {
  @NowaGenerated({'loader': 'auto-constructor'})
  const ChunkInfoCard({
    super.key,
    required this.title,
    required this.chunks,
    required this.onTap,
  });

  final String title;

  final List<ChunkItem> chunks;

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ChunkCube(
            size: 80.0,
            cubeColor: Theme.of(context).colorScheme.primary,
            onTap: () {},
          ),
          const SizedBox(height: 16.0),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24.0),
          Column(
            children: chunks
                .map(
                  (chunk) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            chunk.name,
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurface,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        Text(
                          '${chunk.pointType}: ${chunk.pointValue}',
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.onSurface,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 32.0),
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: 64.0,
              height: 64.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary,
                  width: 3.0,
                ),
              ),
              child: Icon(
                Icons.play_arrow,
                size: 40.0,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
