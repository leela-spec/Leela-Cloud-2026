import 'package:flutter/material.dart';
import 'package:leela_cloud_2026/models/upcoming_row.dart';
import 'package:nowa_runtime/nowa_runtime.dart';
import 'package:leela_cloud_2026/components/neon_gradient_border.dart';

@NowaGenerated()
class CMP_Table_Upcoming extends StatelessWidget {
  @NowaGenerated({'loader': 'auto-constructor'})
  const CMP_Table_Upcoming({
    this.p_rows = const [],
    this.p_isExpanded = false,
    this.p_onToggle,
    this.p_onTapRow,
    super.key,
  });

  final List<UpcomingRow> p_rows;

  final bool p_isExpanded;

  final Function()? p_onToggle;

  final Function(String)? p_onTapRow;

  @override
  Widget build(BuildContext context) {
    return NeonGradientBorder(
      borderRadius: 12.0,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                if (p_onToggle != null) {
                  p_onToggle?.call();
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Upcoming Events',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  Icon(
                    p_isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: Theme.of(context).colorScheme.primary,
                    size: 24.0,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12.0),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    'Start',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withOpacity(0.6),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Text(
                    'Name',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withOpacity(0.6),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Time Until',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withOpacity(0.6),
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            if (p_rows.isNotEmpty)
              _UpcomingRowWidget(
                row: p_rows[0],
                onTap: () {
                  if (p_onToggle != null) {
                    p_onToggle?.call();
                  }
                  if (p_onTapRow != null) {
                    p_onTapRow?.call(p_rows[0].id);
                  }
                },
              ),
            if (p_rows.length > 1)
              Visibility(
                visible: p_isExpanded,
                child: Column(
                  children: [
                    const SizedBox(height: 4.0),
                    _UpcomingRowWidget(
                      row: p_rows[1],
                      onTap: () {
                        if (p_onToggle != null) {
                          p_onToggle?.call();
                        }
                        if (p_onTapRow != null) {
                          p_onTapRow?.call(p_rows[1].id);
                        }
                      },
                    ),
                  ],
                ),
              ),
            if (p_rows.length > 2)
              Visibility(
                visible: p_isExpanded,
                child: Column(
                  children: [
                    const SizedBox(height: 4.0),
                    _UpcomingRowWidget(
                      row: p_rows[2],
                      onTap: () {
                        if (p_onToggle != null) {
                          p_onToggle?.call();
                        }
                        if (p_onTapRow != null) {
                          p_onTapRow?.call(p_rows[2].id);
                        }
                      },
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

@NowaGenerated()
class _UpcomingRowWidget extends StatelessWidget {
  @NowaGenerated({'loader': 'auto-constructor'})
  const _UpcomingRowWidget({required this.row, this.onTap, super.key});

  final UpcomingRow row;

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          color: Colors.transparent,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                row.startLabel,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Text(
                row.name,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                row.timeUntilLabel,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
