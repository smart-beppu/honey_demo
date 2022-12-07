import 'package:flutter/material.dart';

class HivesRoute extends StatelessWidget {
  final Size size;
  const HivesRoute({super.key, required this.size});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 1,
      height: size.height * 0.24,
      child: Stack(
        children: <Widget>[
          Row(
            children: <Widget>[
              for (int i = 0; i < 3; i++)
                Container(
                  width: size.width / 3,
                  decoration: BoxDecoration(
                      color: i == 1
                          ? const Color.fromARGB(255, 255, 234, 167)
                          : Colors.transparent,
                      shape: BoxShape.circle),
                ),
            ],
          ),
          Row(
            children: <Widget>[
              for (int i = 0; i < 3; i++)
                Container(
                  width: size.width / 3,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          "asstes/images/hive.png",
                        ),
                        fit: BoxFit.fitWidth),
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }
}
