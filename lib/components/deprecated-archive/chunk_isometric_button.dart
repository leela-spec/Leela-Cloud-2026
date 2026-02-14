import 'package:flutter/material.dart';
import 'package:nowa_runtime/nowa_runtime.dart';
import 'package:leela_cloud_2026/components/deprecated-archive/chunk_isometric_cube_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:leela_cloud_2026/cube_size.dart';

@NowaGenerated()
class ChunkIsometricButton extends StatefulWidget {
  @NowaGenerated({'loader': 'auto-constructor'})
  const ChunkIsometricButton({
    this.icon,
    this.outlineColor = Colors.purple,
    this.size = CubeSize.medium,
    required this.onTap,
    this.faceColor,
    this.strokeWidth = 2.0,
    super.key,
  });

  final dynamic icon;

  final Color outlineColor;

  final CubeSize size;

  final void Function() onTap;

  final Color? faceColor;

  final double strokeWidth;

  @override
  State<ChunkIsometricButton> createState() {
    return _ChunkIsometricButtonState();
  }
}

@NowaGenerated()
class _ChunkIsometricButtonState extends State<ChunkIsometricButton> {
  bool _isPressed = false;

  double get _cubeSize {
    if (widget.size == CubeSize.small) {
      return 40.0;
    } else if (widget.size == CubeSize.medium) {
      return 60.0;
    } else if (widget.size == CubeSize.large) {
      return 80.0;
    } else {
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
        widget.onTap();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        transform: Matrix4.identity()..scale(_isPressed ? 0.95 : 1.0),
        child: CustomPaint(
          size: Size(_cubeSize, _cubeSize),
          painter: _IsometricCubePainter(
            outlineColor: widget.outlineColor,
            faceColor: widget.faceColor ?? Colors.white.withValues(alpha: 0.1),
            strokeWidth: widget.strokeWidth,
          ),
          child: SizedBox(
            width: _cubeSize,
            height: _cubeSize,
            child: Center(child: _buildIcon()),
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
          colorFilter: ColorFilter.mode(widget.outlineColor, BlendMode.srcIn),
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

@NowaGenerated()
class _IsometricCubePainter extends CustomPainter {
  _IsometricCubePainter({
    required this.outlineColor,
    required this.faceColor,
    required this.strokeWidth,
  });

  final Color outlineColor;

  final Color faceColor;

  final double strokeWidth;

  @override
  bool shouldRepaint(_IsometricCubePainter oldDelegate) {
    return oldDelegate.outlineColor != outlineColor ||
        oldDelegate.faceColor != faceColor ||
        oldDelegate.strokeWidth != strokeWidth;
  }

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
    final depth = width * 0.25;
    final frontPath = Path()
      ..moveTo(width * 0.2, height * 0.3)
      ..lineTo(width * 0.8, height * 0.3)
      ..lineTo(width * 0.8, height * 0.7)
      ..lineTo(width * 0.2, height * 0.7)
      ..close();
    final topPath = Path()
      ..moveTo(width * 0.2, height * 0.3)
      ..lineTo(width * 0.2 + depth * 0.7, height * 0.3 - depth * 0.5)
      ..lineTo(width * 0.8 + depth * 0.7, height * 0.3 - depth * 0.5)
      ..lineTo(width * 0.8, height * 0.3)
      ..close();
    final rightPath = Path()
      ..moveTo(width * 0.8, height * 0.3)
      ..lineTo(width * 0.8 + depth * 0.7, height * 0.3 - depth * 0.5)
      ..lineTo(width * 0.8 + depth * 0.7, height * 0.7 - depth * 0.5)
      ..lineTo(width * 0.8, height * 0.7)
      ..close();
    canvas.drawPath(
      topPath,
      fillPaint..color = faceColor.withValues(alpha: 0.05),
    );
    canvas.drawPath(
      rightPath,
      fillPaint..color = faceColor.withValues(alpha: 0.03),
    );
    canvas.drawPath(frontPath, fillPaint..color = faceColor);
    canvas.drawPath(topPath, paint);
    canvas.drawPath(rightPath, paint);
    canvas.drawPath(frontPath, paint);
  }
}
