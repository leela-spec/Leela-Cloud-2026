import 'package:flutter/material.dart';
import 'package:nowa_runtime/nowa_runtime.dart';

@NowaGenerated()
class ST_SymbolIcon extends StatelessWidget {
  @NowaGenerated({'loader': 'auto-constructor'})
  const ST_SymbolIcon({super.key, this.symbol});

  final dynamic symbol;

  @override
  Widget build(BuildContext context) {
    IconData iconData = Icons.help_outline;
    if (symbol is Map && symbol['icon'] != null) {
      iconData = symbol['icon'] as IconData;
    } else if (symbol is IconData) {
      iconData = symbol;
    }
    return Icon(
      iconData,
      size: 18,
      color: Theme.of(context).colorScheme.primary,
    );
  }
}
