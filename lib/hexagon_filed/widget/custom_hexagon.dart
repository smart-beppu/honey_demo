import 'dart:math';

import 'package:flutter/material.dart';

class HexagonContainer extends StatelessWidget {
  final int num;
  final Size size;

  final String? text;

  const HexagonContainer(
      {super.key, required this.num, required this.size, this.text});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      children: [
        for (int i = 0; i < num; i++)
          Container(
            width: size.width * 0.12, // 1 ≒ 8*0.12
            height: size.height * 0.08,
            child: GestureDetector(
              onTap: () {
                print("test");
              },
              child: CustomPaint(
                painter: num == 1
                    ? CustomHexagon(
                        color: const Color.fromARGB(255, 189, 126, 74),
                        strokeWidth: 1,
                        testSize: size)
                    : CustomHexagon(
                        color: i == 0
                            ? const Color.fromARGB(255, 255, 255, 255)
                            : const Color.fromARGB(255, 255, 234, 167),
                        borderColor: i == 0
                            ? const Color.fromARGB(255, 253, 203, 110)
                            : const Color.fromARGB(255, 225, 112, 85),
                        strokeWidth: i == 0 ? 5 : 1,
                        testSize: size),
                child: Center(
                  child: Text(
                    text ?? num.toString(),
                    style: TextStyle(
                      color: num == 1 ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class NumCounter {
  int _count = 0;
  int get count => _count;
  void countUpNumber() {
    _count++;
  }
}

class CustomHexagon extends CustomPainter {
  final Size testSize;
  final Color color;
  final Color? borderColor;
  final double strokeWidth;
  CustomHexagon(
      {required this.testSize,
      required this.color,
      this.borderColor,
      required this.strokeWidth});
  @override
  void paint(Canvas canvas, Size size) {
    const double sides = 6.0; //多角形の設定
    double radius = testSize.width * 0.076; //図形のサイズ30.0
    const angle = (pi * 2) / sides;
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
    Offset startPoint = Offset(radius * cos(0.0), radius * sin(0.0));
    path.moveTo(startPoint.dx + center.dx, startPoint.dy + center.dy); //始点

    for (int i = 1; i <= sides; i++) {
      double x = radius * cos(angle * i) + center.dx;
      double y = radius * sin(angle * i) + center.dy;
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
