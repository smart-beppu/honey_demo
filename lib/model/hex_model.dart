import 'package:flutter/material.dart';
import 'dart:math' as math;

class HexModel extends ChangeNotifier {
  int leftNumber = 0;
  int rightNumber = 0;
  String formula = "   =";
  String mathProblem = "";
  int inputNumber = 0;
  int count = 0;

  void changeText(int leftNum, int rightNum) {
    leftNumber = leftNum;
    rightNumber = rightNum;
    formula = "${leftNum.toString()}×${rightNum.toString()} =";
    notifyListeners();
  }

  void selectNum(int num) {
    inputNumber = num;
    notifyListeners();
  }

  void setMathProblem() {
    final rand = math.Random();
    mathProblem = "${rand.nextInt(3) + 1}×${rand.nextInt(8) + 1}";
  }

  void countNum() {
    count++;
    notifyListeners();
  }

  void checkAnswer({required int inputNum, required int answer}) {
    if (inputNum == answer) {
      print("正解");
    } else {
      print("不正解");
    }
  }
}
