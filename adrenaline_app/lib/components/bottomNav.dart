import 'dart:math';

import 'package:expandable_bottom_bar/expandable_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:adrenaline_app/models/dice.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:adrenaline_app/global.dart' as global;

class StatefulNav extends StatefulWidget {
  const StatefulNav({Key? key}) : super(key: key);

  @override
  BottomNav createState() => BottomNav();
}

class BottomNav extends State<StatefulNav> with TickerProviderStateMixin {
  late Cube modeld4;
  late Object modeld6;
  late Object modeld8;
  late Object modeld10;
  late Object modeld12;
  late Object modeld20;
  @override
  void initState() {
    modeld4 = Cube(
      onSceneCreated: (Scene scene) {
        scene.world.add(Object(fileName: "assets/3d/dice10/d10.obj"));
        scene.camera.zoom = 10;
      },
    );
    modeld6 = Object(fileName: "assets/3d/dice10/d10.obj");
    modeld8 = Object(fileName: "assets/3d/dice10/d10.obj");
    modeld10 = Object(fileName: "assets/3d/dice10/d10.obj");
    modeld12 = Object(fileName: "assets/3d/dice10/d10.obj");
    modeld20 = Object(fileName: "assets/3d/dice10/d10.obj");

    super.initState();
  }

  double d4X = 0, d4Y = 0, d4Z = 0, iconSize = 20;
  int d4Count = 1;
  List<Dice> dices = [];
  Iterable<int> values = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Text("oi"),
      bottomNavigationBar: SizedBox(
        child: GestureDetector(
          onVerticalDragUpdate: DefaultBottomBarController.of(context).onDrag,
          onVerticalDragEnd: DefaultBottomBarController.of(context).onDragEnd,
          child: BottomExpandableAppBar(
              appBarHeight: 15,
              horizontalMargin: 2,
              expandedBackColor: Colors.grey,
              expandedBody: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
                child: Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    TableRow(
                      children: [
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: modeld4,
                        ),
                        AnimatedContainer(
                            height: 100,
                            width: 100,
                            transformAlignment: Alignment.center,
                            duration: const Duration(seconds: 1),
                            transform: Matrix4.identity()
                              ..rotateX(d4X)
                              ..rotateY(d4Y)
                              ..rotateZ(d4Z),
                            child: modeld4),
                      ],
                    ),
                    TableRow(
                      children: [
                        AnimatedContainer(
                          height: 100,
                          width: 100,
                          transformAlignment: Alignment.center,
                          duration: const Duration(seconds: 1),
                          transform: Matrix4.identity()
                            ..rotateX(d4X)
                            ..rotateY(d4Y)
                            ..rotateZ(d4Z),
                          child: MaterialButton(
                            onPressed: incD8,
                            child: const Icon(
                              Icons.directions,
                              size: 20,
                            ),
                          ),
                        ),
                        AnimatedContainer(
                          height: 100,
                          width: 100,
                          transformAlignment: Alignment.center,
                          duration: const Duration(seconds: 1),
                          transform: Matrix4.identity()
                            ..rotateX(d4X)
                            ..rotateY(d4Y)
                            ..rotateZ(d4Z),
                          child: MaterialButton(
                            onPressed: incD10,
                            child: const Icon(
                              Icons.directions,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        AnimatedContainer(
                          height: 100,
                          width: 100,
                          transformAlignment: Alignment.center,
                          duration: const Duration(seconds: 1),
                          transform: Matrix4.identity()
                            ..rotateX(d4X)
                            ..rotateY(d4Y)
                            ..rotateZ(d4Z),
                          child: MaterialButton(
                            onPressed: incD12,
                            child: const Icon(
                              Icons.directions,
                              size: 20,
                            ),
                          ),
                        ),
                        AnimatedContainer(
                          height: 100,
                          width: 100,
                          transformAlignment: Alignment.center,
                          duration: const Duration(seconds: 1),
                          transform: Matrix4.identity()
                            ..rotateX(d4X)
                            ..rotateY(d4Y)
                            ..rotateZ(d4Z),
                          child: MaterialButton(
                            onPressed: incD20,
                            child: const Icon(
                              Icons.directions,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(children: [
                      Row(children: dices.map((dice) => dice.icon).toList()),
                      MaterialButton(
                          height: 50,
                          onPressed: rollDices,
                          child: const Text("Roll")),
                    ]),
                    TableRow(children: [
                      Text(values.toString()),
                      MaterialButton(
                          height: 50,
                          onPressed: resetDices,
                          child: Text("Reset")),
                    ])
                  ],
                ),
              )),
        ),
      ),
    );
  }

  void incD4() {
    setState(() {
      dices.add(Dice("d4"));
    });
  }

  void incD6() {
    setState(() {
      dices.add(Dice("d6"));
    });
  }

  void incD8() {
    setState(() {
      dices.add(Dice("d8"));
    });
  }

  void incD10() {
    setState(() {
      dices.add(Dice("d10"));
    });
  }

  void incD12() {
    setState(() {
      dices.add(Dice("d12"));
    });
  }

  void incD20() {
    setState(() {
      dices.add(Dice("d20"));
    });
  }

  void rollDices() {
    values = [];
    values = dices.map((dice) => Random().nextInt(dice.value) + 1);
    setState(() {});
  }

  void resetDices() {
    setState(() {
      d4X = 0;
      d4Y = 0;
      d4Z = 0;
      dices = [];
      values = [];
    });
  }
}
