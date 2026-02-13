import 'package:flutter/material.dart';
import 'package:nowa_runtime/nowa_runtime.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Represents a chunk item with an icon to display in the container
class ChunkIconItem {
  const ChunkIconItem({
    required this.iconPath,
    this.onTap,
  });

  /// Path to the icon asset (supports .svg and .png formats)
  final String iconPath;

  /// Optional callback when the chunk icon is tapped
  final VoidCallback? onTap;
}

@NowaGenerated()
class ChunksContainerQuad extends StatelessWidget {
  @NowaGenerated({'loader': 'auto-constructor'})
  const ChunksContainerQuad({
    required this.children,
    this.height = 80.0,
    this.itemSize = 48.0,
    this.itemSpacing = 8.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    this.strokeColor = Colors.purple,
    this.strokeWidth = 1.56,
    this.skewOffset = 20.0,
    this.iconColorFilter,
    super.key,
  });

  /// List of chunk items to display as icons in the container
  final List<ChunkIconItem> children;

  /// The height of the container (default: 80.0)
  final double height;

  /// The size of each icon item (default: 48.0)
  final double itemSize;

  /// Spacing between icon items (default: 8.0)
  final double itemSpacing;

  /// Padding inside the container (default: horizontal 16, vertical 8)
  final EdgeInsets padding;

  /// The color of the quad outline stroke
  final Color strokeColor;

  /// The width of the quad outline stroke
  final double strokeWidth;

  /// The horizontal offset for the pseudo isometric skew effect (default: 20.0)
  final double skewOffset;

  /// Optional color filter to apply to all icons (default: null, keeps original colors)
  final ColorFilter? iconColorFilter;

  /// Calculate the total width needed for the container
  double get _calculatedWidth {
    if (children.isEmpty) {
      return padding.horizontal + skewOffset + 40; // Minimum width
    }
    return (children.length * itemSize) +
        ((children.length - 1) * itemSpacing) +
        padding.horizontal +
        skewOffset;
  }

  /// Generate the SVG string for the quad outline that grows with width
  /// Skews to the left to match the cube aesthetic
  String _buildQuadSvg(double width, double height) {
    // Left-leaning parallelogram (matches cube aesthetic)
    // Top-right corner pulled left, bottom-right stays at full width
    return '''<svg viewBox="0 0 $width $height" xmlns="http://www.w3.org/2000/svg">
  <path d="M 0 0 L ${width - skewOffset} 0 L $width $height L $skewOffset $height Z" fill="none" stroke="#000000" stroke-width="$strokeWidth" stroke-linecap="round" stroke-linejoin="round"/>
</svg>''';
  }

  Widget _buildIconItem(ChunkIconItem item) {
    Widget iconWidget;

    if (item.iconPath.toLowerCase().endsWith('.svg')) {
      iconWidget = SvgPicture.asset(
        item.iconPath,
        width: itemSize,
        height: itemSize,
        fit: BoxFit.contain,
        colorFilter: iconColorFilter,
      );
    } else {
      iconWidget = Image.asset(
        item.iconPath,
        width: itemSize,
        height: itemSize,
        fit: BoxFit.contain,
      );
    }

    if (item.onTap != null) {
      return GestureDetector(
        onTap: item.onTap,
        child: iconWidget,
      );
    }
    return iconWidget;
  }

  @override
  Widget build(BuildContext context) {
    final totalWidth = _calculatedWidth;

    return SizedBox(
      width: totalWidth,
      height: height,
      child: Stack(
        children: [
          // Background quad outline
          Positioned.fill(
            child: SvgPicture.string(
              _buildQuadSvg(totalWidth, height),
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(strokeColor, BlendMode.srcIn),
            ),
          ),
          // Children row
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.only(
                left: padding.left + (skewOffset / 2),
                right: padding.right + (skewOffset / 2),
                top: padding.top,
                bottom: padding.bottom,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: children.asMap().entries.map((entry) {
                  final index = entry.key;
                  final item = entry.value;
                  return Padding(
                    padding: EdgeInsets.only(
                      right: index < children.length - 1 ? itemSpacing : 0,
                    ),
                    child: _buildIconItem(item),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
