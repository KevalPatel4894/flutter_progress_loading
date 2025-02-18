import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../theme.dart';

class ProgressLoadingProgress extends StatefulWidget {
  final double value;

  const ProgressLoadingProgress({
    super.key,
    required this.value,
  });

  @override
  ProgressLoadingProgressState createState() => ProgressLoadingProgressState();
}

class ProgressLoadingProgressState extends State<ProgressLoadingProgress> {
  /// value of progress, should be 0.0~1.0.
  double _value = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void updateProgress(double value) {
    setState(() {
      _value = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ProgressLoadingTheme.indicatorSize,
      height: ProgressLoadingTheme.indicatorSize,
      child: _CircleProgress(
        value: _value,
        color: ProgressLoadingTheme.progressColor,
        width: ProgressLoadingTheme.progressWidth,
      ),
    );
  }
}

class _CircleProgress extends ProgressIndicator {
  final double value;
  final double width;
  final Color color;

  const _CircleProgress({
    required this.value,
    required this.width,
    required this.color,
  });

  @override
  __CircleProgressState createState() => __CircleProgressState();
}

class __CircleProgressState extends State<_CircleProgress> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _CirclePainter(
        color: widget.color,
        value: widget.value,
        width: widget.width,
      ),
    );
  }
}

class _CirclePainter extends CustomPainter {
  final Color color;
  final double value;
  final double width;

  _CirclePainter({
    required this.color,
    required this.value,
    required this.width,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = width
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      Offset.zero & size,
      -math.pi / 2,
      math.pi * 2 * value,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(_CirclePainter oldDelegate) => value != oldDelegate.value;
}
