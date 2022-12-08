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
      child: Row(
        children: [
          for (int i = 0; i < 15; i++)
            HexagonWidget.flat(
              width: size.width * 0.2,
              color: Colors.purple,
              child: const Text("六角形"),
            ),
        ],
      ),
      //  Column(
      //   children: <Widget>[
      //     HexagonOffsetGrid.oddFlat(
      //       columns: 10,
      //       rows: 5,
      //       buildTile: (col, row) => HexagonWidgetBuilder(
      //           padding: 1, color: Colors.purple, elevation: 2),
      //       buildChild: (col, row) {
      //         return GestureDetector(
      //           onTap: (() => print(row)),
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               Text(col.toString()),
      //               Text(",${row.toString()}"),
      //             ],
      //           ),
      //         );
      //       },
      //     ),
      //   ],
      // )
    );
  }
}
