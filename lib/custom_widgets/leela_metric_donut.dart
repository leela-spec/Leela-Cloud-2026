import 'package:flutter/material.dart';
import 'package:nowa_runtime/nowa_runtime.dart';
import 'package:leela_cloud_2026/leela_donut_painter.dart';

@NowaGenerated()
class LeelaMetricDonut extends StatefulWidget {
  @NowaGenerated({'loader': 'auto-constructor'})
  const LeelaMetricDonut({
    super.key,
    this.label = 'TP',
    this.realized = 0,
    this.timeTarget = 0,
    this.target = 1,
    this.size = 72,
    this.thickness = 10,
    this.showTimeDot = true,
    this.showDeficitStripe = true,
    this.enablePulse = false,
    this.animateOnChange = false,
    this.primaryColor,
    this.trackColor,
    this.successColor = const Color(0xFF128734),
    this.deficitColor = const Color(0xFFB3114D),
    this.dotCenterColor = const Color(0xFF000000),
    this.dotRingColor = const Color(0xFFF2F2FF),
  });

  final String label;

  final double realized;

  final double timeTarget;

  final double target;

  final double size;

  final double thickness;

  final bool showTimeDot;

  final bool showDeficitStripe;

  final bool enablePulse;

  final bool animateOnChange;

  final Color? primaryColor;

  final Color? trackColor;

  final Color successColor;

  final Color deficitColor;

  final Color dotCenterColor;

  final Color dotRingColor;

  @override
  State<LeelaMetricDonut> createState() {
    return _LeelaMetricDonutState();
  }
}

@NowaGenerated()
class _LeelaMetricDonutState extends State<LeelaMetricDonut> {
  double _prevRealized = 0.0;

  double _prevTimeTarget = 0.0;

  double _prevTarget = 1.0;

  @override
  void initState() {
    super.initState();
    _prevRealized = widget.realized;
    _prevTimeTarget = widget.timeTarget;
    _prevTarget = widget.target <= 0 ? 1.0 : widget.target;
  }

  @override
  void didUpdateWidget(LeelaMetricDonut oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.animateOnChange) {
      _prevRealized = oldWidget.realized;
      _prevTimeTarget = oldWidget.timeTarget;
      _prevTarget = oldWidget.target <= 0 ? 1.0 : oldWidget.target;
    } else {
      _prevRealized = widget.realized;
      _prevTimeTarget = widget.timeTarget;
      _prevTarget = widget.target <= 0 ? 1.0 : widget.target;
    }
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final primary = widget.primaryColor ?? cs.primary;
    final track = widget.trackColor ?? cs.secondary.withOpacity(0.35);
    final targetSafe = widget.target <= 0 ? 1.0 : widget.target;
    final beginRealized = widget.animateOnChange
        ? _prevRealized
        : widget.realized;
    final beginTimeTarget = widget.animateOnChange
        ? _prevTimeTarget
        : widget.timeTarget;
    final beginTarget = widget.animateOnChange ? _prevTarget : targetSafe;
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: beginRealized, end: widget.realized),
      duration: widget.animateOnChange
          ? const Duration(milliseconds: 650)
          : Duration.zero,
      curve: Curves.easeOutCubic,
      builder: (context, realizedAnim, _) => TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: beginTimeTarget, end: widget.timeTarget),
        duration: widget.animateOnChange
            ? const Duration(milliseconds: 650)
            : Duration.zero,
        curve: Curves.easeOutCubic,
        builder: (context, timeTargetAnim, __) => TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: beginTarget, end: targetSafe),
          duration: widget.animateOnChange
              ? const Duration(milliseconds: 650)
              : Duration.zero,
          curve: Curves.easeOutCubic,
          builder: (context, targetAnim, ___) => TweenAnimationBuilder<double>(
            tween: Tween<double>(
              begin: 0.0,
              end: widget.enablePulse ? 1.0 : 0.0,
            ),
            duration: widget.enablePulse
                ? const Duration(milliseconds: 900)
                : Duration.zero,
            curve: Curves.easeInOut,
            builder: (context, pulseT, ____) {
              final pulse = widget.enablePulse
                  ? (1 - (2 * (pulseT - 0.5)).abs())
                  : 0.0;
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: widget.size,
                    height: widget.size,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CustomPaint(
                          painter: LeelaDonutPainter(
                            realized: realizedAnim,
                            timeTarget: timeTargetAnim,
                            target: targetAnim,
                            thickness: widget.thickness,
                            primary: primary,
                            track: track,
                            success: widget.successColor,
                            deficit: widget.deficitColor,
                            dotCenter: widget.dotCenterColor,
                            dotRing: widget.dotRingColor,
                            showDot: widget.showTimeDot,
                            showDeficitStripe: widget.showDeficitStripe,
                            glow: pulse,
                          ),
                        ),
                        Text(
                          widget.label,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                fontWeight: FontWeight.w800,
                                letterSpacing: 1.0,
                              ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 6.0),
                  Text(
                    realizedAnim.toStringAsFixed(0),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
