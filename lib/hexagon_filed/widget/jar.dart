import 'package:flutter/material.dart';

class Jar extends StatelessWidget {
  final Size size;
  const Jar({super.key, required this.size});
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
          width: size.width * 0.15,
          height: size.height * 0.26,
          decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.3),
              image: const DecorationImage(
                  image: AssetImage("asstes/images/jar.png"),
                  fit: BoxFit.fitWidth),
              borderRadius: BorderRadius.circular(60)),
        ),
        Container(
          width: size.width * 0.15,
          height: size.height * 0.08,
          decoration: const BoxDecoration(
              image:
                  DecorationImage(image: AssetImage("asstes/images/bee.png"))),
        )
      ],
    );
  }
}
