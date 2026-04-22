import 'package:flutter/material.dart';

class MagicalPathPainter extends CustomPainter {
  MagicalPathPainter({this.color = const Color(0xFFFDECB5)});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(size.width / 2, size.height);

    // Draw dashed path
    const dashWidth = 8.0;
    const dashSpace = 6.0;
    double distance = 0.0;
    
    // Compute total length
    final metrics = path.computeMetrics();
    for (final metric in metrics) {
      while (distance < metric.length) {
        canvas.drawPath(
          metric.extractPath(distance, distance + dashWidth),
          paint,
        );
        distance += dashWidth + dashSpace;
      }
    }

    // Add a subtle glow behind the path
    final glowPaint = Paint()
      ..color = color.withValues(alpha: 0.3)
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4);

    distance = 0.0;
    for (final metric in metrics) {
      while (distance < metric.length) {
        canvas.drawPath(
          metric.extractPath(distance, distance + dashWidth),
          glowPaint,
        );
        distance += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant MagicalPathPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
