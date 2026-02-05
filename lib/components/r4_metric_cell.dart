import 'package:flutter/material.dart';
import 'package:nowa_runtime/nowa_runtime.dart';

@NowaGenerated()
class R4MetricCell extends StatelessWidget {
  @NowaGenerated({'loader': 'auto-constructor'})
  const R4MetricCell({super.key, required this.label, required this.value});

  final String label;

  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
