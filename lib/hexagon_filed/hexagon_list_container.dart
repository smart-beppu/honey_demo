import 'package:flutter/material.dart';
import 'package:hexagon_demo/Lists/hex_containr_list.dart';
import 'package:hexagon_demo/hexagon_filed/widget/custom_hexagon.dart';

class HexagonListContainer extends StatelessWidget {
  final Size size;

  const HexagonListContainer({
    super.key,
    required this.size,
  });
  @override
  Widget build(BuildContext context) {
    late NumCounter numberCounter = NumCounter();
    return Container(
      width: size.width * 1,
      height: size.height * 0.53,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < hexList.length; i++)
            Padding(
              padding: i == 0
                  ? EdgeInsets.only(top: size.height / 13)
                  : EdgeInsets.zero,
              child: HexagonContainer(
                num: hexList[i],
                size: size,
                numCounter: numberCounter,
              ),
            ),
        ],
      ),
    );
  }
}
