import 'dart:math';

import 'package:expandable_bottom_bar/expandable_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:adrenaline_app/models/dice.dart';

class StatefulNav extends StatefulWidget {
  const StatefulNav({Key? key}) : super(key: key);

  @override
  BottomNav createState() => BottomNav();
}

class BottomNav extends State<StatefulNav> with TickerProviderStateMixin {
  double d4X = 0, d4Y = 0, d4Z = 0, iconSize = 20;
  int d4Count = 1;
  List<Dice> dices = [];
  List<int> values = [];
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
            expandedBody: Column(children: [
              Table(
                children: [
                  TableRow(
                    children: [
                      AnimatedContainer(
                        color: Colors.red,
                        transformAlignment: Alignment.center,
                        duration: const Duration(seconds: 1),
                        transform: Matrix4.identity()
                          ..rotateX(d4X)
                          ..rotateY(d4Y)
                          ..rotateZ(d4Z),
                        child: MaterialButton(
                          onPressed: incD4,
                          child: const Icon(
                            Icons.directions,
                            size: 200,
                          ),
                        ),
                      ),
                      AnimatedContainer(
                        color: Colors.red,
                        transformAlignment: Alignment.center,
                        duration: const Duration(seconds: 1),
                        transform: Matrix4.identity()
                          ..rotateX(d4X)
                          ..rotateY(d4Y)
                          ..rotateZ(d4Z),
                        child: MaterialButton(
                          onPressed: incD6,
                          child: const Icon(
                            Icons.directions,
                            size: 200,
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      AnimatedContainer(
                        color: Colors.red,
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
                            size: 200,
                          ),
                        ),
                      ),
                      AnimatedContainer(
                        color: Colors.red,
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
                            size: 200,
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      AnimatedContainer(
                        color: Colors.red,
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
                            size: 200,
                          ),
                        ),
                      ),
                      AnimatedContainer(
                        color: Colors.red,
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
                            size: 200,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              MaterialButton(
                onPressed: rollDices,
                child: Row(children: dices.map((dice) => dice.icon).toList()),
              ),
              MaterialButton(
                onPressed: resetDices,
                child: Row(
                    children: values.map((value) => Text("$value")).toList()),
              ),
            ]),
          ),
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
    setState(() {
      d4X = 180;
      d4Y = 180;
      d4Z = 180;

      dices.map((dice) => values.add(Random().nextInt(dice.value) + 1));
    });
  }

  void resetDices() {
    d4X = 0;
    d4Y = 0;
    d4Z = 0;
    dices = [];
    values = [];
  }
}
