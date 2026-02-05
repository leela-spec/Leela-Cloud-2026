import 'package:nowa_runtime/nowa_runtime.dart';

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
        widget.onTap.call();
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
