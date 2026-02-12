import 'package:flutter/material.dart';
import 'package:nowa_runtime/nowa_runtime.dart';
import 'package:leela_cloud_2026/components/leela_neon_metric_donut.dart';

@NowaGenerated()
class CMP_Metric_Donut extends StatelessWidget {
  @NowaGenerated({'loader': 'auto-constructor'})
  const CMP_Metric_Donut({
    required this.p_label,
    required this.p_realized,
    required this.p_timeTarget,
    required this.p_target,
    required this.p_open,
    required this.p_planned,
    this.p_onInfo,
    this.p_onTapDonut,
    required this.p_metricId,
    super.key,
  });

  final String p_label;

  final double p_realized;

  final double p_timeTarget;

  final double p_target;

  final int p_open;

  final int p_planned;

  final void Function(String)? p_onInfo;

  final void Function()? p_onTapDonut;

  final String p_metricId;

  @override
  Widget build(BuildContext context) {
    final double targetValue = p_target > 0
        ? p_target
        : (p_planned > 0 ? p_planned.toDouble() : 100);
    final double timeTargetValue = p_timeTarget > 0
        ? p_timeTarget
        : targetValue * 0.65;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        LeelaNeonMetricDonut(
          label: p_label,
          realized: p_realized,
          timeTarget: timeTargetValue,
          target: targetValue,
          size: 80,
          strokeWidth: 10,
          enablePulse: false,
          onTap: p_onTapDonut,
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              p_label,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            const SizedBox(width: 4),
            GestureDetector(
              onTap: () {
                if (p_onInfo != null) {
                  p_onInfo?.call(p_metricId);
                }
              },
              child: Icon(
                Icons.info_outline,
                size: 16,
                color: Theme.of(
                  context,
                ).colorScheme.primary.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          'Open: ${p_open}',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.5),
          ),
        ),
      ],
    );
  }
}
