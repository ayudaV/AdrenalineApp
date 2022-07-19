// ignore_for_file: unnecessary_new

import 'package:adrenaline_app/components/bottomNav.dart';
import 'package:adrenaline_app/screens/login.dart';
import 'package:adrenaline_app/screens/signup.dart';
import 'package:adrenaline_app/screens/mainScreen.dart';

import 'package:expandable_bottom_bar/expandable_bottom_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Adrenaline RPG',
        theme: ThemeData.dark(),
        home: DefaultBottomBarController(
          child: SafeArea(child: StatefulLogin()),
        ));
  }
}
