import 'package:flutter/material.dart';

class CurvedPainter extends CustomPainter {
  final double opacity;
  final double yValue;
  final Color color;
  final bool inReverse;

  CurvedPainter({
    required this.opacity,
    required this.yValue,
    required this.color,
    required this.inReverse,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint();
    paint.color = color.withOpacity(opacity);
    paint.style = PaintingStyle.fill;

    final path = Path();

    path.moveTo(0, size.height);

    path.quadraticBezierTo(
      size.width * 0.5,
      size.height,
      (size.width * 0.5) - (inReverse ? 20 : 10),
      yValue + 25,
    );

    path.quadraticBezierTo(
      size.width * 0.5,
      yValue + (inReverse ? 25 : 0),
      (size.width * 0.5) + (inReverse ? 20 : 10),
      yValue + 25,
    );

    path.quadraticBezierTo(
      size.width * 0.5,
      size.height,
      size.width,
      size.height,
    );

    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
