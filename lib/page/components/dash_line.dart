import 'package:flutter/material.dart';
import 'package:flutter_app_bmi_calculator/theme/color_theme.dart';

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 3, dashSpace = 2, startX = 0;
    final paint = Paint()
      ..color = kAccentColor
      ..strokeWidth = 2;
    while (startX < size.width - 35) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
