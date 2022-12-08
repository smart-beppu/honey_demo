import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:hexagon_demo/Lists/hex_containr_list.dart';
import 'package:hexagon_demo/hexagon_widget.dart';
import 'package:hexagon_demo/model/hex_model.dart';
import 'package:provider/provider.dart';

class HexagonContainer extends StatelessWidget {
  final int num;
  final Size size;
  final NumCounter numCounter;

  const HexagonContainer({
    super.key,
    required this.num,
    required this.size,
    required this.numCounter,
  });

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HexModel>(context);
    return Wrap(
      direction: Axis.vertical,
      children: [
        for (int i = 0; i < num; i++) hexContaier(i, model),
      ],
    );
  }

  Widget hexContaier(int num, HexModel model) {
    numCounter.countUpNumber();
    int hexNumber = numCounter.count;
    final lNum = math.Random().nextInt(3);
    final rNum = math.Random().nextInt(8);
    leftNumList.shuffle();
    rightNumList.shuffle();

    // return Consumer<HexModel>(builder: (context, model, child) {
    //   model.setMathProblem();
    return Container(
      width: size.width * 0.12, // 1 ≒ 8*0.12
      height: size.height * 0.08,
      child: InkWell(
          onTap: () {
            model.changeText(leftNumList[lNum], rightNumList[rNum]);
          },
          child: CuntomHex(hexNumber, leftNumList[lNum], rightNumList[rNum])),
    );
    // });
  }

  Widget CuntomHex(int num, int leftNum, int rightNum) {
    return CustomPaint(
      painter: HexagonWidget(
          color: num == 1 || num == 27
              ? const Color.fromARGB(255, 189, 126, 74)
              : const Color.fromARGB(255, 255, 234, 167),
          borderColor: num == 1 || num == 27
              ? const Color.fromARGB(255, 189, 126, 74)
              : const Color.fromARGB(255, 225, 112, 85),
          strokeWidth: 1,
          testSize: size),
      child: Center(
        child: Text(
          num == 1
              ? "Start"
              : num == 27
                  ? "Finish"
                  : "",
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
