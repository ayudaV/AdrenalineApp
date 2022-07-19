import 'package:flutter/cupertino.dart';

class Dice {
  String type;
  int value = 1;
  ImageIcon icon = const ImageIcon(AssetImage("assets/images/d4.png"));

  //Construtor
  Dice(this.type) {
    switch (type) {
      case "d4":
        value = 4;
        icon = const ImageIcon(AssetImage("assets/images/d4.png"));
        break;
      case "d6":
        value = 6;
        icon = const ImageIcon(AssetImage("assets/images/d6.png"));
        break;
      case "d8":
        value = 8;
        icon = const ImageIcon(AssetImage("assets/images/d8.png"));
        break;
      case "d10":
        value = 10;
        icon = const ImageIcon(AssetImage("assets/images/d10.png"));
        break;
      case "d12":
        value = 12;
        icon = const ImageIcon(AssetImage("assets/images/d12.png"));
        break;
      case "d20":
        value = 20;
        icon = const ImageIcon(AssetImage("assets/images/d20.png"));
        break;
      default:
        value = 4;
        icon = const ImageIcon(AssetImage("assets/images/d4.png"));
    }
  }
}
