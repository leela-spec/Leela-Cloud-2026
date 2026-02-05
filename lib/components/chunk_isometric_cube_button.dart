import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Size options for the ChunkIsometricButton
enum CubeSize {
  small,
  medium,
  large,
  xxl,
}

/// A custom Flutter widget that displays an interactive isometric cube button
/// with customizable outline color, icon, and size.
class ChunkIsometricButton extends StatefulWidget {
  /// The icon to display on the front face of the cube
  /// Can be an IconData, AssetImage path (String), or SvgPicture asset path (String with .svg extension)
  final dynamic icon;

  /// The color of the cube outline (default: purple)
  final Color outlineColor;

  /// The size of the cube button
  final CubeSize size;

  /// Callback function when the button is tapped
  final VoidCallback? onTap;

  /// The color of the front face (default: slightly transparent white)
  final Color? faceColor;

  /// The width of the outline stroke
  final double strokeWidth;

  const ChunkIsometricButton({
    Key? key,
    required this.icon,
    this.outlineColor = Colors.purple,
    this.size = CubeSize.medium,
    this.onTap,
    this.faceColor,
    this.strokeWidth = 2.0,
  }) : super(key: key);

  @override
  State<ChunkIsometricButton> createState() => _ChunkIsometricButtonState();
}

class _ChunkIsometricButtonState extends State<ChunkIsometricButton> {
  bool _isPressed = false;

  double get _cubeSize {
    switch (widget.size) {
      case CubeSize.small:
        return 40.0;
      case CubeSize.medium:
        return 60.0;
      case CubeSize.large:
        return 80.0;
      case CubeSize.xxl:
        return 120.0;
    }
  }

  double get _iconSize {
    return _cubeSize * 0.5;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onTap?.call();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        transform: Matrix4.identity()
          ..scale(_isPressed ? 0.95 : 1.0),
        child: CustomPaint(
          size: Size(_cubeSize, _cubeSize),
          painter: _IsometricCubePainter(
            outlineColor: widget.outlineColor,
            faceColor: widget.faceColor ?? Colors.white.withOpacity(0.1),
            strokeWidth: widget.strokeWidth,
          ),
          child: SizedBox(
            width: _cubeSize,
            height: _cubeSize,
            child: Center(
              child: _buildIcon(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIcon() {
    if (widget.icon is IconData) {
      return Icon(
        widget.icon as IconData,
        size: _iconSize,
        color: widget.outlineColor,
      );
    } else if (widget.icon is String) {
      final iconPath = widget.icon as String;
      if (iconPath.toLowerCase().endsWith('.svg')) {
        return SvgPicture.asset(
          iconPath,
          width: _iconSize,
          height: _iconSize,
          colorFilter: ColorFilter.mode(
            widget.outlineColor,
            BlendMode.srcIn,
          ),
        );
      } else {
        return Image.asset(
          iconPath,
          width: _iconSize,
          height: _iconSize,
          color: widget.outlineColor,
        );
      }
    }
    return const SizedBox.shrink();
  }
}

/// Custom painter for drawing the isometric cube outline
class _IsometricCubePainter extends CustomPainter {
  final Color outlineColor;
  final Color faceColor;
  final double strokeWidth;

  _IsometricCubePainter({
    required this.outlineColor,
    required this.faceColor,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = outlineColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final fillPaint = Paint()
      ..color = faceColor
      ..style = PaintingStyle.fill;

    final width = size.width;
    final height = size.height;

    // Define the depth of the isometric effect (as a ratio of the size)
    final depth = width * 0.25;

    // Front face (quad) - centered
    final frontPath = Path()
      ..moveTo(width * 0.2, height * 0.3)
      ..lineTo(width * 0.8, height * 0.3)
      ..lineTo(width * 0.8, height * 0.7)
      ..lineTo(width * 0.2, height * 0.7)
      ..close();

    // Top face (visible isometric edge)
    final topPath = Path()
      ..moveTo(width * 0.2, height * 0.3)
      ..lineTo(width * 0.2 + depth * 0.7, height * 0.3 - depth * 0.5)
      ..lineTo(width * 0.8 + depth * 0.7, height * 0.3 - depth * 0.5)
      ..lineTo(width * 0.8, height * 0.3)
      ..close();

    // Right face (visible isometric edge)
    final rightPath = Path()
      ..moveTo(width * 0.8, height * 0.3)
      ..lineTo(width * 0.8 + depth * 0.7, height * 0.3 - depth * 0.5)
      ..lineTo(width * 0.8 + depth * 0.7, height * 0.7 - depth * 0.5)
      ..lineTo(width * 0.8, height * 0.7)
      ..close();

    // Draw filled faces with transparency
    canvas.drawPath(topPath, fillPaint..color = faceColor.withOpacity(0.05));
    canvas.drawPath(rightPath, fillPaint..color = faceColor.withOpacity(0.03));
    canvas.drawPath(frontPath, fillPaint..color = faceColor);

    // Draw outlines
    canvas.drawPath(topPath, paint);
    canvas.drawPath(rightPath, paint);
    canvas.drawPath(frontPath, paint);
  }

  @override
  bool shouldRepaint(_IsometricCubePainter oldDelegate) {
    return oldDelegate.outlineColor != outlineColor ||
        oldDelegate.faceColor != faceColor ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}