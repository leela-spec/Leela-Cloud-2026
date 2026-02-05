import 'package:flutter/material.dart';
import 'package:nowa_runtime/nowa_runtime.dart';

@NowaGenerated()
class WGT_ST_EpicGauge extends StatelessWidget {
  @NowaGenerated({'loader': 'auto-constructor'})
  const WGT_ST_EpicGauge({
    super.key,
    required this.score_0_1,
    required this.status,
    required this.label_short,
  });

  final double score_0_1;

  final String status;

  final String label_short;

  Color _getStatusColor(BuildContext context) {
    if (status == 'low') {
      return Colors.orange;
    } else if (status == 'high') {
      return Colors.green;
    } else {
      return Theme.of(context).colorScheme.primary;
    }
  }

  @override
  Widget build(BuildContext context) {
    final statusColor = _getStatusColor(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 100,
          height: 100,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: CircularProgressIndicator(
                  value: score_0_1.clamp(0, 1),
                  strokeWidth: 8,
                  backgroundColor: Theme.of(
                    context,
                  ).colorScheme.surfaceContainerHighest,
                  valueColor: AlwaysStoppedAnimation<Color>(statusColor),
                ),
              ),
              Text(
                '${(score_0_1 * 100).round()}%',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: statusColor,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Text(
          status.toUpperCase(),
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: statusColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label_short,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
