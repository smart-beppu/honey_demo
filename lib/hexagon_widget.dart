//六角形の作成
import 'package:flutter/material.dart';
import 'dart:math' as math;

class HexagonWidget extends CustomPainter {
  final Size testSize;
  final Color color;
  final Color? borderColor;
  final double strokeWidth;
  HexagonWidget(
      {required this.testSize,
      required this.color,
      this.borderColor,
      required this.strokeWidth});
  @override
  void paint(Canvas canvas, Size size) {
    const double sides = 6.0; //多角形の設定
    double radius = testSize.width * 0.076;
    const angle = (math.pi * 2) / sides;
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.butt;
    final borderPaint = Paint()
      ..color = borderColor ?? const Color.fromARGB(255, 189, 126, 74)
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    Path path = Path();

    Offset center = Offset(testSize.width / 18, testSize.height / 25); //ポジション
    Offset startPoint = Offset(radius * math.cos(0.0), radius * math.sin(0.0));
    path.moveTo(startPoint.dx + center.dx, startPoint.dy + center.dy); //始点

    for (int i = 1; i <= sides; i++) {
      double x = radius * math.cos(angle * i) + center.dx;
      double y = radius * math.sin(angle * i) + center.dy;
      path.lineTo(x, y); //x軸にスタート地点,y軸のスタート地点

    }
    canvas.drawPath(path, paint); //オブジェクト描写
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
