import 'package:flutter/material.dart';
import 'package:nowa_runtime/nowa_runtime.dart';

@NowaGenerated()
class CMP_Metric_Donut extends StatelessWidget {
  @NowaGenerated({'loader': 'auto-constructor'})
  const CMP_Metric_Donut({
    super.key,
    this.p_label = 'TP',
    this.p_realized = 0,
    this.p_open = 0,
    this.p_planned = 0,
    this.p_onInfo,
    this.p_metricId = '',
  });

  final String p_label;

  final int p_realized;

  final int p_open;

  final int p_planned;

  final Function(String)? p_onInfo;

  final String p_metricId;

  @override
  Widget build(BuildContext context) {
    final double percentage = p_planned > 0 ? (p_realized / p_planned) : 0.0;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 80.0,
              height: 80.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Theme.of(
                    context,
                  ).colorScheme.primary.withValues(alpha: 0.3),
                  width: 8.0,
                ),
              ),
            ),
            Container(
              width: 80.0,
              height: 80.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary,
                  width: 8.0,
                ),
              ),
              child: ClipOval(
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      height: 80 * percentage,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(
                            context,
                          ).colorScheme.primary.withValues(alpha: 0.2),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '$p_realized',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Text(
                  '/ $p_planned',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 8.0),
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
            const SizedBox(width: 4.0),
            GestureDetector(
              onTap: () {
                if (p_onInfo != null) {
                  p_onInfo?.call(p_metricId);
                }
              },
              child: Icon(
                Icons.info_outline,
                size: 16.0,
                color: Theme.of(
                  context,
                ).colorScheme.primary.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4.0),
        Text(
          'Open: $p_open',
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
