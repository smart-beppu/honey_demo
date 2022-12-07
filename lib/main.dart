import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hexagon_demo/formula_field/formula_field.dart';
import 'package:hexagon_demo/hexagon_filed/hexagon_list_container.dart';
import 'package:hexagon_demo/hexagon_filed/widget/jar.dart';
import 'package:hexagon_demo/hives_route/hives_route.dart';
import 'package:hexagon_demo/key_pad/key_pad.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _key = GlobalKey();
  Size containerSize = const Size(0, 0);

  @override
  void initState() {
    SchedulerBinding.instance.addPersistentFrameCallback((_) {
      setState(() {
        containerSize = _key.currentContext!.size!;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.transparent),
        body: Stack(children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            color: const Color.fromARGB(255, 229, 229, 229),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: AspectRatio(
              aspectRatio: 9 / 16,
              child: Container(
                key: _key,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    HivesRoute(size: containerSize),
                    Stack(
                      children: [
                        HexagonListContainer(size: containerSize),
                        Positioned(
                            top: containerSize.height * 0.25,
                            left: containerSize.width * 0.24,
                            child: Jar(
                              size: containerSize,
                              num: 1,
                            )),
                        Positioned(
                            bottom: containerSize.height * 0.29,
                            left: containerSize.width * 0.36,
                            child: Jar(
                              size: containerSize,
                              num: 2,
                            )),
                        Positioned(
                            top: containerSize.height * 0.13,
                            left: containerSize.width * 0.6,
                            child: Jar(
                              size: containerSize,
                              num: 3,
                            )),
                      ],
                    ),
                    // HexagonPackage(size: containerSize),HEXマップ作れるライブラリ
                    FormulaField(size: containerSize),
                    KeyPadContainer(size: containerSize)
                  ],
                ),
              ),
            ),
          ),
        ]));
  }
}
