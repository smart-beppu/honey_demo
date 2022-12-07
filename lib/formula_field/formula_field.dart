import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class FormulaField extends StatelessWidget {
  final Size size;
  const FormulaField({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 1,
      height: size.height * 0.1,
      color: const Color.fromARGB(255, 189, 126, 74),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const NumText(text: "3"),
          const NumText(text: "×"),
          const NumText(text: "6"),
          const NumText(text: "="),
          Row(
            children: <Widget>[
              Container(
                width: size.width * 0.15,
                height: size.height * 0.08,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      top: border(),
                      bottom: border(),
                      left: border(),
                      right: BorderSide.none),
                ),
              ),
              DottedLine(
                lineLength: size.height * 0.06,
                direction: Axis.vertical,
                dashColor: const Color.fromARGB(255, 189, 126, 74),
              ),
              Container(
                width: size.width * 0.15,
                height: size.height * 0.08,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      top: border(),
                      bottom: border(),
                      right: border(),
                      left: BorderSide.none),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  BorderSide border() {
    return BorderSide(color: Color.fromARGB(255, 253, 203, 110), width: 3);
  }
}

class NumText extends StatelessWidget {
  final String text;
  const NumText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(color: Colors.white, fontSize: 50),
    );
  }
}
