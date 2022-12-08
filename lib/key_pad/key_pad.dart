import 'package:flutter/material.dart';
import 'package:hexagon_demo/model/hex_model.dart';
import 'package:provider/provider.dart';

class KeyPadContainer extends StatelessWidget {
  final Size size;

  const KeyPadContainer({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    final List<int> key = [
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      0,
    ];
    final HexModel model = Provider.of<HexModel>(context);

    return Container(
      width: size.width * 1,
      height: size.height * 0.2,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          IconButton(
              size: size,
              onTap: () {
                ("クリア");
              },
              color: const Color.fromARGB(255, 115, 185, 255),
              icon: Icons.backspace),
          Container(
            width: size.width * 0.7,
            child: Wrap(
              direction: Axis.horizontal,
              children: [
                for (int i = 0; i < key.length; i++)
                  InkWell(
                    onTap: () {
                      model.selectNum(key[i]);
                    },
                    child: Padding(
                      padding: EdgeInsets.all(size.width * 0.005),
                      child: Container(
                        height: size.height * 0.08,
                        width: size.width * 0.13,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 9, 132, 227),
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                          child: Text(
                            "${key[i]}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: size.height * 0.05,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          IconButton(
              size: size,
              onTap: () {
                final int answer = model.leftNumber * model.rightNumber;
                final int inputNum = model.inputNumber;
                model.checkAnswer(inputNum: inputNum, answer: answer);
              },
              color: const Color.fromARGB(255, 0, 184, 148),
              icon: Icons.check),
        ],
      ),
    );
  }
}

class IconButton extends StatelessWidget {
  final Size size;
  final void Function() onTap;
  final Color color;
  final IconData icon;
  const IconButton(
      {super.key,
      required this.size,
      required this.onTap,
      required this.color,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(size.width * 0.005),
        child: Container(
          height: size.height * 0.17,
          width: size.width * 0.14,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(5)),
          child: Icon(
            icon,
            color: Colors.white,
            size: size.height * 0.06,
          ),
        ),
      ),
    );
  }
}
