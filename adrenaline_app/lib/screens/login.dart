import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:adrenaline_app/global.dart' as global;
import 'package:http/http.dart' as http;
import 'package:adrenaline_app/models/user.dart';

class StatefulLogin extends StatefulWidget {
  const StatefulLogin({Key? key}) : super(key: key);

  @override
  Login createState() => Login();
}

class Login extends State<StatefulLogin> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  String _responseText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 70, right: 70, top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 50.0,
                child: TextField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    filled: false,
                    labelText: 'Username',
                  ),
                ),
              ),
              SizedBox(
                height: 50.0,
                child: TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    filled: false,
                    labelText: 'Password',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, top: 20),
                child: MaterialButton(
                  onPressed: () {
                    login().then(
                      ((value) => setState(
                            () {
                              if (value.statusCode == 200) {
                                var res = json.decode(value.body);
                                global.token = res["token"];
                                global.user = User(
                                    id: res["id"] as String,
                                    username: res["username"],
                                    firstName: res["firstName"],
                                    lastName: res["lastName"],
                                    email: res["email"],
                                    birthday: res["birthday"],
                                    imageUrl: res["image"],
                                    role: res["role"]);
                              }
                              _responseText = value.reasonPhrase!;
                            },
                          )),
                    );
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(90.0)),
                  padding: const EdgeInsets.all(0.0),
                  child: Ink(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromARGB(255, 29, 53, 87),
                            Color.fromARGB(255, 30, 92, 131),
                          ]),
                      borderRadius: BorderRadius.all(Radius.circular(90.0)),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      width: 300,
                      height: 50,
                      child: const Text(
                        'LOGIN',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                _responseText,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 17,
                ),
              )
            ],
          )),
    );
  }

  Future<http.Response> login() {
    return http.post(
      Uri.parse('${global.apiBaseUrl}auth'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': _usernameController.text,
        'password': _passwordController.text,
      }),
    );
  }
}
