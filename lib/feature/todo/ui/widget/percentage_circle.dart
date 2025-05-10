import 'package:flutter/material.dart';
import 'dart:math';

class PercentageCircle extends StatelessWidget {
  final double percentage; // từ 0.0 đến 1.0
  final double size;
  final Color backgroundColor;
  final Color progressColor;

  const PercentageCircle({
    super.key,
    required this.percentage,
    this.size = 100,
    this.backgroundColor = Colors.grey,
    this.progressColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(size, size),
            painter: _CirclePainter(
              percentage: percentage,
              backgroundColor: backgroundColor,
              progressColor: progressColor,
            ),
          ),
          Text(
            "${(percentage * 100).toInt()}%",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}


class _CirclePainter extends CustomPainter {
  final double percentage;
  final Color backgroundColor;
  final Color progressColor;

  _CirclePainter({
    required this.percentage,
    required this.backgroundColor,
    required this.progressColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final strokeWidth = 8.0;
    final center = size.center(Offset.zero);
    final radius = size.width / 2 - strokeWidth / 2;

    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final progressPaint = Paint()
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, backgroundPaint);

    final sweepAngle = 2 * pi * percentage;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _CirclePainter oldDelegate) =>
      oldDelegate.percentage != percentage;
}
