import 'package:flutter/material.dart';
import 'package:nowa_runtime/nowa_runtime.dart';

@NowaGenerated()
class ST_SymbolStrip extends StatelessWidget {
  @NowaGenerated({'loader': 'auto-constructor'})
  const ST_SymbolStrip({super.key, required this.symbols, this.maxVisible = 4});

  final List<dynamic> symbols;

  final int maxVisible;

  @override
  Widget build(BuildContext context) {
    if (symbols.isEmpty) {
      return const SizedBox.shrink();
    }
    final int visibleCount = symbols.length > maxVisible
        ? maxVisible
        : symbols.length;
    final int overflowCount = symbols.length - visibleCount;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < visibleCount; i++) ...[
          ST_SymbolIcon(symbol: symbols[i]),
          if (i < visibleCount - 1) const SizedBox(width: 4),
        ],
        if (overflowCount > 0) ...[
          const SizedBox(width: 4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '+$overflowCount',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
