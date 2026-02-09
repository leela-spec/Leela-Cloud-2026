import 'package:flutter/material.dart';
import 'package:nowa_runtime/nowa_runtime.dart';
import 'package:flutter_svg/flutter_svg.dart';

@NowaGenerated()
class ChunkCube extends StatefulWidget {
  @NowaGenerated({'loader': 'auto-constructor'})
  const ChunkCube({
    this.icon,
    this.size = 80.0,
    required this.onTap,
    this.cubeColor = Colors.purple,
    this.iconColor,
    super.key,
  });

  /// The icon to display on top of the cube (optional)
  /// Can be an IconData, AssetImage path (String), or SvgPicture asset path (String with .svg extension)
  final dynamic icon;

  /// The size of the cube (default: 80.0)
  final double size;

  /// Callback function when the button is tapped
  final void Function() onTap;

  /// The color of the background cube outline
  final Color cubeColor;

  /// The color of the top icon
  final Color? iconColor;

  @override
  State<ChunkCube> createState() {
    return _ChunkCubeState();
  }
}

@NowaGenerated()
class _ChunkCubeState extends State<ChunkCube> {
  bool _isPressed = false;

  String get _cubeSvg {
    return '<svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">\n  <!-- Left face -->\n  <path d="M 50 15 L 20 32 L 20 68 L 50 85 Z" fill="#9333EA" fill-opacity="0.3" stroke="#9333EA" stroke-width="2"/>\n  \n  <!-- Right face -->\n  <path d="M 50 15 L 80 32 L 80 68 L 50 85 Z" fill="#9333EA" fill-opacity="0.2" stroke="#9333EA" stroke-width="2"/>\n  \n  <!-- Top face -->\n  <path d="M 50 15 L 20 32 L 50 48 L 80 32 Z" fill="#9333EA" fill-opacity="0.5" stroke="#9333EA" stroke-width="2"/>\n</svg>\n';
  }

  Widget _buildIcon() {
    if (widget.icon == null) {
      return const SizedBox.shrink();
    }
    final iconSize = widget.size * 0.4;
    final effectiveIconColor = widget.iconColor ?? widget.cubeColor;
    if (widget.icon is IconData) {
      return Icon(
        widget.icon as IconData,
        size: iconSize,
        color: effectiveIconColor,
      );
    } else if (widget.icon is String) {
      final iconPath = widget.icon as String;
      if (iconPath.toLowerCase().endsWith('.svg')) {
        return SvgPicture.asset(
          iconPath,
          width: iconSize,
          height: iconSize,
          colorFilter: ColorFilter.mode(effectiveIconColor, BlendMode.srcIn),
        );
      } else {
        return Image.asset(
          iconPath,
          width: iconSize,
          height: iconSize,
          color: effectiveIconColor,
        );
      }
    }
    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onTap.call();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        transform: Matrix4.identity()..scale(_isPressed ? 0.9 : 1.0),
        child: SizedBox(
          width: widget.size,
          height: widget.size,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.string(
                _cubeSvg,
                width: widget.size,
                height: widget.size,
                fit: BoxFit.contain,
                colorFilter: ColorFilter.mode(
                  widget.cubeColor,
                  BlendMode.srcIn,
                ),
              ),
              if (widget.icon != null)
                Container(
                  width: widget.size,
                  height: widget.size,
                  alignment: Alignment.center,
                  child: _buildIcon(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
