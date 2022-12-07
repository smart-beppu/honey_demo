import 'package:flutter/material.dart';

class KeyPadContainer extends StatelessWidget {
  const KeyPadContainer({super.key, required this.size});
  final Size size;

  @override
  Widget build(BuildContext context) {
    final List<int> key = [0, 1, 2, 3, 4, 5, 6, 10, 7, 8, 9, 0, 11];
    return Container(
      height: size.height * 0.2,
      width: double.infinity,
      //9:16の縦のスペーサーなくすために画面サイズ横一杯に
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Wrap(
            direction: Axis.horizontal,
            children: <Widget>[
              for (int i = 1; i < 13; i++)
                Padding(
                  padding: EdgeInsets.all(size.width * 0.005),
                  child: NumIconButton(
                    size: size,
                    color: key[i] == 10
                        ? const Color.fromARGB(255, 129, 191, 221)
                        : key[i] == 11
                            ? Colors.greenAccent
                            : Colors.blue,
                    widget: key[i] == 10
                        ? const Icon(
                            Icons.undo,
                            color: Colors.white,
                          )
                        : key[i] == 11
                            ? const Icon(
                                Icons.check,
                                color: Colors.white,
                              )
                            : Text(
                                key[i].toString(),
                                style: const TextStyle(color: Colors.white),
                              ),
                    text: key[i],
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class NumIconButton extends StatelessWidget {
  final Size size;
  final Color color;
  final Widget widget;
  final text;
  const NumIconButton(
      {super.key,
      required this.size,
      required this.color,
      required this.widget,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        print(text);
      }),
      child: Container(
        height: size.height * 0.07,
        width: size.width * 0.15,
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(5)),
        child: FittedBox(
            fit: BoxFit.contain,
            child: Container(
                height: size.height * 0.04, child: Center(child: widget))),
      ),
    );
  }
}
