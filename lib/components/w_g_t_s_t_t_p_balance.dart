import 'package:flutter/material.dart';
import 'package:nowa_runtime/nowa_runtime.dart';

@NowaGenerated()
class WGT_ST_TPBalance extends StatelessWidget {
  @NowaGenerated({'loader': 'auto-constructor'})
  const WGT_ST_TPBalance({
    super.key,
    required this.tp_balance,
    required this.tp_status,
  });

  final double tp_balance;

  final String tp_status;

  Color _getStatusColor(BuildContext context) {
    if (tp_status == 'under') {
      return Colors.orange;
    } else if (tp_status == 'over') {
      return Colors.red;
    } else {
      return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    final statusColor = _getStatusColor(context);
    final clampedValue = tp_balance.clamp(-1, 1);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'TP Balance',
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 16),
        Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: FractionallySizedBox(
                    widthFactor: clampedValue < 0 ? (-clampedValue) : 0,
                    child: Container(
                      height: 24,
                      decoration: BoxDecoration(
                        color: statusColor.withValues(alpha: 0.7),
                        borderRadius: const BorderRadius.horizontal(
                          left: Radius.circular(4),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: 2,
                height: 40,
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.3),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: FractionallySizedBox(
                    widthFactor: clampedValue > 0 ? clampedValue : 0,
                    child: Container(
                      height: 24,
                      decoration: BoxDecoration(
                        color: statusColor.withValues(alpha: 0.7),
                        borderRadius: const BorderRadius.horizontal(
                          right: Radius.circular(4),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Low',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            Text(
              'OK',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'High',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          tp_status.toUpperCase(),
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: statusColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Demand = Path • Supply = Rhythm',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(
              context,
            ).colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }
}
