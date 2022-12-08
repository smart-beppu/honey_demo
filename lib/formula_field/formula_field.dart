import 'package:flutter/material.dart';
import 'package:hexagon_demo/model/hex_model.dart';
import 'package:provider/provider.dart';

class FormulaField extends StatelessWidget {
  final Size size;
  const FormulaField({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size.width * 1,
        height: size.height * 0.1,
        color: const Color.fromARGB(255, 189, 126, 74),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: size.height * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Provider.of<HexModel>(context).formula,
                    style: const TextStyle(color: Colors.white, fontSize: 45),
                  ),
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
                                right: border()),
                          ),
                          child: Text(
                            (Provider.of<HexModel>(context).inputNumber)
                                .toString(),
                            style: const TextStyle(fontSize: 45),
                            textAlign: TextAlign.center,
                          )),
                      // DottedLine(
                      //   lineLength: size.height * 0.06,
                      //   direction: Axis.vertical,
                      //   dashColor: const Color.fromARGB(255, 189, 126, 74),
                      // ),
                      // Container(
                      //   width: size.width * 0.15,
                      //   height: size.height * 0.08,
                      //   decoration: BoxDecoration(
                      //     color: Colors.white,
                      //     border: Border(
                      //         top: border(),
                      //         bottom: border(),
                      //         right: border(),
                      //         left: BorderSide.none),
                      //   ),
                      //   child: Center(
                      //       child: Text(
                      //     " ${model.iinputNumber.last}",
                      //     style: const TextStyle(fontSize: 45),
                      //   )),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  BorderSide border() {
    return const BorderSide(
        color: Color.fromARGB(255, 253, 203, 110), width: 3);
  }
}
