import 'package:flutter/material.dart';
import 'package:nowa_runtime/nowa_runtime.dart';
import 'package:leela_cloud_2026/models/hero_item.dart';

@NowaGenerated()
class CMP_HeroCarousel extends StatefulWidget {
  @NowaGenerated({'loader': 'auto-constructor'})
  const CMP_HeroCarousel({
    this.p_items = const [],
    this.p_activeIndex = 0,
    this.p_onSwipe,
    this.p_onTapItem,
    super.key,
  });

  final List<HeroItem> p_items;

  final int p_activeIndex;

  final Function(int)? p_onSwipe;

  final Function(String)? p_onTapItem;

  @override
  State<CMP_HeroCarousel> createState() {
    return _CMP_HeroCarouselState();
  }
}

@NowaGenerated()
class _CMP_HeroCarouselState extends State<CMP_HeroCarousel> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: widget.p_activeIndex,
      viewportFraction: 0.9,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.p_items.isEmpty) {
      return Container(
        height: 200.0,
        alignment: Alignment.center,
        child: Text(
          'No hero items available',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.5),
          ),
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Your Next Best Action',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        SizedBox(
          height: 220.0,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.p_items.length,
            onPageChanged: (index) {
              if (widget.p_onSwipe != null) {
                widget.p_onSwipe?.call(index);
              }
            },
            itemBuilder: (context, index) => _HeroCard(
              item: widget.p_items[index],
              onTap: () {
                if (widget.p_onTapItem != null) {
                  widget.p_onTapItem?.call(widget.p_items[index].chunkId);
                }
              },
            ),
          ),
        ),
        const SizedBox(height: 12.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.p_items.length,
            (index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              width: index == widget.p_activeIndex ? 24.0 : 8.0,
              height: 8.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: index == widget.p_activeIndex
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.3),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

@NowaGenerated()
class _HeroCard extends StatelessWidget {
  @NowaGenerated({'loader': 'auto-constructor'})
  const _HeroCard({required this.item, this.onTap, super.key});

  final HeroItem item;

  final Function()? onTap;

  IconData _getSymbolIcon(String? symbolKey) {
    if (symbolKey == null) {
      return Icons.star;
    }
    if (symbolKey == 'music') {
      return Icons.music_note;
    }
    if (symbolKey == 'flashcards') {
      return Icons.style;
    }
    if (symbolKey == 'video') {
      return Icons.play_circle_outline;
    }
    if (symbolKey == 'book') {
      return Icons.menu_book;
    }
    return Icons.star;
  }

  Widget _buildRewardBadge(BuildContext context, String label, int? value) {
    if (value == null) {
      return const SizedBox.shrink();
    }
    return Container(
      margin: const EdgeInsets.only(right: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(width: 4.0),
          Text(
            '+${value}',
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).colorScheme.primaryContainer,
              Theme.of(context).colorScheme.secondaryContainer,
            ],
          ),
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Theme.of(
                context,
              ).colorScheme.primary.withValues(alpha: 0.2),
              blurRadius: 8.0,
              offset: const Offset(0.0, 4.0),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).colorScheme.primary.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Icon(
                    _getSymbolIcon(item.symbolKey),
                    color: Theme.of(context).colorScheme.primary,
                    size: 28.0,
                  ),
                ),
                if (item.platform != null)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 6.0,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Text(
                      item.platform!,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 12.0),
            Text(
              item.title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4.0),
            if (item.subtitle != null)
              Text(
                item.subtitle!,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(
                    context,
                  ).colorScheme.onPrimaryContainer.withValues(alpha: 0.7),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            const SizedBox(height: 8.0),
            if (item.epicBlock != null)
              Text(
                item.epicBlock!,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(
                    context,
                  ).colorScheme.onPrimaryContainer.withValues(alpha: 0.6),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    _buildRewardBadge(context, 'TP', item.tp),
                    _buildRewardBadge(context, 'XP', item.xp),
                    _buildRewardBadge(context, 'BP', item.bp),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.play_arrow,
                    color: Theme.of(context).colorScheme.onPrimary,
                    size: 20.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
