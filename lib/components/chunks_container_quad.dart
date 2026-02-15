import 'package:flutter/material.dart';
import 'package:nowa_runtime/nowa_runtime.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChunkIconItem {
  const ChunkIconItem({required this.iconPath, this.onTap});
  final String iconPath;
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
      return padding.horizontal + skewOffset + 40;
    }
    return (children.length * itemSize) +
        ((children.length - 1) * itemSpacing) +
        padding.horizontal +
        skewOffset;
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
      return GestureDetector(onTap: item.onTap, child: iconWidget);
    }
    return iconWidget;
  }

  /// Generate the SVG string for the quad outline that matches the ChunkCube isometric aesthetic
  String _buildQuadSvg(double width, double height) {
    return '<svg viewBox="0 0 ${width} ${height}" xmlns="http://www.w3.org/2000/svg">\n  <!-- Outer outline -->\n  <path d="M 0 ${height} L ${width - skewOffset} ${height} L ${width} ${height - skewOffset} L ${width} 0 L ${skewOffset} 0 L 0 ${skewOffset} Z" fill="none" stroke="#000000" stroke-width="${strokeWidth}" stroke-linecap="round" stroke-linejoin="round"/>\n  <!-- Inner horizontal edge -->\n  <path d="M 0 ${skewOffset} L ${width - skewOffset} ${skewOffset}" fill="none" stroke="#000000" stroke-width="${strokeWidth}" stroke-linecap="round" stroke-linejoin="round"/>\n  <!-- Inner vertical edge -->\n  <path d="M ${width - skewOffset} ${height} L ${width - skewOffset} ${skewOffset}" fill="none" stroke="#000000" stroke-width="${strokeWidth}" stroke-linecap="round" stroke-linejoin="round"/>\n  <!-- Inner diagonal edge -->\n  <path d="M ${width} 0 L ${width - skewOffset} ${skewOffset}" fill="none" stroke="#000000" stroke-width="${strokeWidth}" stroke-linecap="round" stroke-linejoin="round"/>\n</svg>';
  }

  @override
  Widget build(BuildContext context) {
    final totalWidth = _calculatedWidth;
    return SizedBox(
      width: totalWidth,
      height: height,
      child: Stack(
        children: [
          Positioned.fill(
            child: SvgPicture.string(
              _buildQuadSvg(totalWidth, height),
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(strokeColor, BlendMode.srcIn),
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.only(
                left: padding.left,
                right: padding.right + skewOffset,
                top: padding.top + skewOffset,
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
                      right: index < children.length - 1 ? itemSpacing : 0.0,
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
