import 'package:flutter/material.dart';
import 'package:nowa_runtime/nowa_runtime.dart';

@NowaGenerated()
class ST_SymbolStrip extends StatelessWidget {
  @NowaGenerated({'loader': 'auto-constructor'})
  const ST_SymbolStrip({required this.symbols, this.maxVisible = 4, super.key});

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
          _buildSymbol(context, symbols[i]),
          if (i < visibleCount - 1 || overflowCount > 0)
            const SizedBox(width: 6),
        ],
        if (overflowCount > 0)
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
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildSymbol(BuildContext context, dynamic symbol) {
    if (symbol is int) {
      return Container(
        width: 20.0,
        height: 20.0,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: Text(
          symbol.toString(),
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            fontWeight: FontWeight.bold,
            fontSize: 10.0,
          ),
        ),
      );
    }
    if (symbol is Map && symbol['type'] == 'badge') {
      final val = int.tryParse(symbol['value'].toString());
      if (val != null) {
        return _buildSymbol(context, val);
      }
    }
    if (symbol is Map &&
        symbol['type'] == 'icon' &&
        symbol['value'] is IconData) {
      return _buildSymbol(context, symbol['value']);
    }
    return Icon(
      symbol is IconData ? symbol : Icons.help_outline,
      size: 20.0,
      color: Theme.of(context).colorScheme.primary,
    );
  }
}
