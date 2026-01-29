import 'package:flutter/material.dart';
import 'package:nowa_runtime/nowa_runtime.dart';

@NowaGenerated()
class CMP_Nav_TopBar extends StatelessWidget {
  @NowaGenerated({'loader': 'auto-constructor'})
  const CMP_Nav_TopBar({
    super.key,
    this.p_title = 'Home',
    this.p_showSearch = true,
    this.p_showSettings = true,
    this.p_showSid = true,
    this.p_navOrder = const ['search', 'settings', 'home', 'sid'],
    this.p_onTapSearch,
    this.p_onTapSettings,
    this.p_onTapSid,
    this.p_screenId = '',
  });

  final String p_title;

  final bool p_showSearch;

  final bool p_showSettings;

  final bool p_showSid;

  final List<String> p_navOrder;

  final Function()? p_onTapSearch;

  final Function()? p_onTapSettings;

  final Function(String)? p_onTapSid;

  final String p_screenId;

  Widget _buildNavButton(String navItem) {
    switch (navItem.toLowerCase()) {
      case 'search':
        if (!p_showSearch) {
          return const SizedBox.shrink();
        }
        return _NavButton(label: 'Search', onTap: p_onTapSearch);
      case 'settings':
        if (!p_showSettings) {
          return const SizedBox.shrink();
        }
        return _NavButton(label: 'Settings', onTap: p_onTapSettings);
      case 'home':
        return _NavButton(label: p_title, onTap: null);
      case 'sid':
        if (!p_showSid) {
          return const SizedBox.shrink();
        }
        return _NavButton(
          label: 'Sid',
          onTap: p_onTapSid != null ? () => p_onTapSid?.call(p_screenId) : null,
        );
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      color: Theme.of(context).colorScheme.surface,
      child: Row(
        children: p_navOrder
            .map((navItem) => Expanded(child: _buildNavButton(navItem)))
            .toList(),
      ),
    );
  }
}

@NowaGenerated()
class _NavButton extends StatelessWidget {
  @NowaGenerated({'loader': 'auto-constructor'})
  const _NavButton({required this.label, this.onTap});

  final String label;

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: onTap != null
              ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.1)
              : Colors.transparent,
        ),
        child: Center(
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: onTap != null
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}
