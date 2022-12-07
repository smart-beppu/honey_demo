import 'package:flutter/material.dart';
import 'package:hexagon_demo/key_pad/key_pad.dart';

class Jar extends StatelessWidget {
  final Size size;
  final int num;
  const Jar({super.key, required this.size, required this.num});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // CustomPaint(
        //   painter: CustomHexagon(
        //       testSize: size,
        //       color: Colors.red,
        //       strokeWidth: 0,
        //       borderColor: Colors.transparent),
        //   child: const Image(image: AssetImage("asstes/images/jar.png")),
        // ),

        Container(
          width: size.width * 0.14,
          height: size.height * 0.25,
          decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage("asstes/images/jar.png"),
                  fit: BoxFit.fitWidth),
              borderRadius: BorderRadius.circular(60)),
        ),
        bee(num)
      ],
    );
  }

  Widget bee(num) {
    if (num == 1) {
      return Row(
        children: [
          Container(
            width: size.width * 0.075,
            height: size.height * 0.08,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("asstes/images/bee$num.png"),
                  fit: BoxFit.contain),
            ),
          ),
          Container(
            width: size.width * 0.075,
            height: size.height * 0.08,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("asstes/images/bee.png"),
                  fit: BoxFit.contain),
            ),
          ),
        ],
      );
    }
    if (num == 3) {
      return Container(
        width: size.width * 0.15,
        height: size.height * 0.08,
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage("asstes/images/bee.png"))),
      );
    }
    return Container();
  }
}
