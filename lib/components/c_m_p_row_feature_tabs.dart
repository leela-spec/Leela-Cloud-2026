import 'package:flutter/material.dart';
import 'package:leela_cloud_2026/models/feature_tab_item.dart';
import 'package:nowa_runtime/nowa_runtime.dart';

@NowaGenerated()
class CMP_Row_FeatureTabs extends StatelessWidget {
  @NowaGenerated({'loader': 'auto-constructor'})
  const CMP_Row_FeatureTabs({
    super.key,
    this.p_items = const [],
    this.p_activeKey = 'st',
    this.p_onSelectTab,
    this.p_onOpenTab,
  });

  final List<FeatureTabItem> p_items;

  final String p_activeKey;

  final Function(String)? p_onSelectTab;

  final Function(String)? p_onOpenTab;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
      child: Row(
        children: p_items
            .map(
              (item) => Expanded(
                child: _TabSegment(
                  item: item,
                  isActive: item.key == p_activeKey,
                  onSelectTab: p_onSelectTab,
                  onOpenTab: p_onOpenTab,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

@NowaGenerated()
class _TabSegment extends StatelessWidget {
  @NowaGenerated({'loader': 'auto-constructor'})
  const _TabSegment({
    required this.item,
    required this.isActive,
    this.onSelectTab,
    this.onOpenTab,
  });

  final FeatureTabItem item;

  final bool isActive;

  final Function(String)? onSelectTab;

  final Function(String)? onOpenTab;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: isActive
            ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.15)
            : Colors.transparent,
        border: isActive
            ? Border.all(
                color: Theme.of(context).colorScheme.primary,
                width: 1.5,
              )
            : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (onSelectTab != null) {
                  onSelectTab?.call(item.key);
                }
              },
              child: Text(
                item.label,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                  color: isActive
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.onSurface,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (onOpenTab != null) {
                onOpenTab?.call(item.route);
              }
            },
            child: Icon(
              Icons.open_in_new,
              size: 16.0,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
