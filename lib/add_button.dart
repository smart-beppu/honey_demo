import 'package:flutter/material.dart';
import 'package:hexagon_demo/model/hex_model.dart';

class AddButton extends StatelessWidget {
  final HexModel model;
  const AddButton({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: MaterialButton(
        onPressed: () {
          model.countNum();
          print(model.count);
        },
        color: Colors.blue,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
