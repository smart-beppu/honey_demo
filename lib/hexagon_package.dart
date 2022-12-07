import 'package:flutter/material.dart';
import 'package:hexagon/hexagon.dart';
import 'package:hexagon_demo/Lists/hex_containr_list.dart';

class HexagonPackage extends StatelessWidget {
  final Size size;
  const HexagonPackage({super.key, required this.size});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: size.width * 1,
        height: size.height * 0.5,
        color: Colors.greenAccent,
        child: Column(
          children: <Widget>[
            HexagonOffsetGrid.oddFlat(
              columns: 8,
              rows: hexList[0],
              buildTile: (col, row) => HexagonWidgetBuilder(
                  padding: 1, color: Colors.purple, elevation: 3),
              buildChild: (col, row) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(col.toString()),
                    Text(",${row.toString()}"),
                  ],
                );
              },
            ),
          ],
        )

        // HexagonWidget.flat(
        //   width: size.width * 0.3,
        //   color: Colors.purple,
        //   padding: 5.0,
        //   child: const Text("六角形"),
        // ),
        );
  }
}
