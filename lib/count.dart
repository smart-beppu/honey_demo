import 'package:flutter/material.dart';
import 'package:hexagon_demo/add_button.dart';

import 'model/hex_model.dart';

class Count extends StatelessWidget {
  final Size size;
  final HexModel model;
  const Count({super.key, required this.size, required this.model});
  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      width: size.width * 1,
      height: size.height * 0.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Text("${model.count}")],
          ),
          AddButton(model: model)
        ],
      ),
    );
  }
}
