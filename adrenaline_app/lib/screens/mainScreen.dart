import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';
import 'package:adrenaline_app/global.dart' as global;

class StatefulMain extends StatefulWidget {
  const StatefulMain({Key? key}) : super(key: key);

  @override
  MainScreen createState() => MainScreen();
}

class MainScreen extends State<StatefulMain> {
  String username = "Dummy";
  String urlUserImage = "Images/Users/1658184416429_face.png";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: const Color.fromARGB(255, 70, 70, 70),
          title: Text(
            "Louro João",
            style: TextStyle(fontSize: 20, fontFamily: "Azonix"),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: CircleAvatar(
                  radius: 30,
                  backgroundImage:
                      NetworkImage(global.apiBaseUrl + global.user!.imageUrl)),
            )
          ],
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {},
                      ),
                      IconButton(icon: Icon(Icons.delete), onPressed: () {}),
                    ],
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                            margin: EdgeInsets.only(bottom: 5),
                            height: 70,
                            color: const Color.fromARGB(255, 150, 150, 150),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("NPC"),
                                  Image(
                                      image: NetworkImage(global.apiBaseUrl +
                                          global.user!.imageUrl))
                                ],
                              ),
                            )),
                        Container(
                            margin: EdgeInsets.only(bottom: 5),
                            height: 70,
                            color: const Color.fromARGB(255, 150, 150, 150),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("NPC"),
                                  Image(
                                      image: NetworkImage(global.apiBaseUrl +
                                          global.user!.imageUrl))
                                ],
                              ),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
