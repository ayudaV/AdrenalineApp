import 'package:adrenaline_app/models/user.dart';
import 'package:flutter/material.dart';

ThemeData myThemeData = ThemeData(
  primaryColor: const Color.fromARGB(255, 29, 53, 87),
  selectedRowColor: const Color.fromARGB(255, 69, 123, 157),
  backgroundColor: const Color.fromARGB(255, 241, 250, 238),
  errorColor: const Color.fromARGB(255, 230, 57, 70),
  primarySwatch: Colors.blue,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

String token = "";
String apiBaseUrl = 'https://adrenaline-rpg-api.herokuapp.com/';
User? user;
