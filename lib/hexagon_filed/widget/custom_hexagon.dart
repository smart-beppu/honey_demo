import 'dart:math';

import 'package:flutter/material.dart';

class HexagonContainer extends StatefulWidget {
  final int num;
  final Size size;
  final String? text;
  final NumCounter numCounter;
  const HexagonContainer(
      {super.key,
      required this.num,
      required this.size,
      this.text,
      required this.numCounter});

  @override
  State<HexagonContainer> createState() => _HexagonContainerState();
}

class _HexagonContainerState extends State<HexagonContainer> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      children: [
        for (int i = 0; i < widget.num; i++) hexContaier(i),
      ],
    );
  }

  Widget hexContaier(int num) {
    widget.numCounter.countUpNumber();

    int hexNumber = widget.numCounter.count;
    return Container(
      width: widget.size.width * 0.12, // 1 ≒ 8*0.12
      height: widget.size.height * 0.08,
      child: GestureDetector(
          onTap: () {
            print(hexNumber);
          },
          child: CuntomHex(hexNumber)),
    );
  }

  Widget CuntomHex(int num) {
    return CustomPaint(
      painter: CustomHexagon(
          color: num == 1 || num == 27
              ? const Color.fromARGB(255, 189, 126, 74)
              : const Color.fromARGB(255, 255, 234, 167),
          borderColor: num == 1 || num == 27
              ? const Color.fromARGB(255, 189, 126, 74)
              : const Color.fromARGB(255, 225, 112, 85),
          strokeWidth: 1,
          testSize: widget.size),
      child: Center(
        child: Text(
          widget.text ?? num.toString(),
          style: TextStyle(
            color: num == 1 || num == 27 ? Colors.white : Colors.black,
          ),
        ),
      ),
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
