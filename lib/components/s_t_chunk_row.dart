import 'package:flutter/material.dart';
import 'package:nowa_runtime/nowa_runtime.dart';
import 'package:leela_cloud_2026/components/s_t_symbol_strip.dart';

@NowaGenerated()
class ST_ChunkRow extends StatelessWidget {
  @NowaGenerated({'loader': 'auto-constructor'})
  const ST_ChunkRow({super.key, this.node, required this.onTap});

  final dynamic node;

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final String chunkName = node is Map
        ? (node['name'] ?? 'Unnamed')
        : node.toString();
    final List<dynamic> symbols = node is Map ? (node['symbols'] ?? []) : [];
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Expanded(
              child: Text(
                chunkName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const SizedBox(width: 16),
            ST_SymbolStrip(symbols: symbols),
          ],
        ),
      ),
    );
  }
}
