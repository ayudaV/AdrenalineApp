import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart' as path;
import 'package:adrenaline_app/global.dart' as global;

import '../models/user.dart';
import 'mainScreen.dart';

class StatefulSignup extends StatefulWidget {
  const StatefulSignup({Key? key}) : super(key: key);

  @override
  Signup createState() => Signup();
}

class Signup extends State<StatefulSignup> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _cpasswordController = TextEditingController();
  final _emailController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _birthdayController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  XFile imageFile = XFile('assets/images/face.png');
  bool isImageSelected = false;
  String _responseText = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 70, right: 70, top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage(imageFile.path),
                radius: 80,
                child: Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                        onPressed: _pickImage,
                        iconSize: 25,
                        color: Colors.grey,
                        icon: const Icon(Icons.mode_edit_sharp))),
              ),
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
              SizedBox(
                height: 50.0,
                child: TextField(
                  controller: _cpasswordController,
                  decoration: const InputDecoration(
                    filled: false,
                    labelText: 'Confirm Password',
                  ),
                ),
              ),
              SizedBox(
                height: 50.0,
                child: TextField(
                  controller: _firstNameController,
                  decoration: const InputDecoration(
                    filled: false,
                    labelText: 'First Name',
                  ),
                ),
              ),
              SizedBox(
                height: 50.0,
                child: TextField(
                  controller: _lastNameController,
                  decoration: const InputDecoration(
                    filled: false,
                    labelText: 'Last Name',
                  ),
                ),
              ),
              SizedBox(
                height: 50.0,
                child: TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    filled: false,
                    labelText: 'Email',
                  ),
                ),
              ),
              SizedBox(
                height: 50.0,
                child: TextField(
                  controller: _birthdayController,
                  keyboardType: TextInputType.datetime,
                  decoration: const InputDecoration(
                    filled: false,
                    labelText: 'Birthday',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, top: 20),
                child: MaterialButton(
                  onPressed: () {
                    _postForm().then(((value) => setState(() {
                          _responseText = value;
                        })));
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
                        'SIGNUP',
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

  Future<void> _pickImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile == null) return;
      setState(() {
        isImageSelected = true;
        imageFile = pickedFile;
      });
    } catch (e) {
      print("Image picker error ");
    }
  }

  Future<String> _postForm() async {
    var request =
        http.MultipartRequest('POST', Uri.parse('${global.apiBaseUrl}users'));
    request.fields['username'] = _usernameController.text;
    request.fields['password'] = _passwordController.text;
    request.fields['firstName'] = _firstNameController.text;
    request.fields['lastName'] = _lastNameController.text;
    request.fields['email'] = _emailController.text;
    request.fields['birthday'] = _birthdayController.text;

    // multipart that takes file
    if (isImageSelected) {
      var stream = http.ByteStream(Stream.castFrom(imageFile.openRead()));
      // get file length
      var length = await imageFile.length(); //imageFile is your image file
      var multipartFileSign = http.MultipartFile('image', stream, length,
          filename: path.basename(imageFile.path),
          contentType: MediaType('image', path.extension(imageFile.path)));
      request.files.add(multipartFileSign);
    }
    var res = await request.send();
    if (res.statusCode == 200) {
      final response = await http.post(
        Uri.parse('${global.apiBaseUrl}auth'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': _usernameController.text,
          'password': _passwordController.text,
        }),
      );
      if (response.statusCode == 200) {
        global.user = User.fromJson(jsonDecode(response.body));
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => StatefulMain(),
        ));
      } else {
        setState(() {
          _responseText = response.reasonPhrase!;
        });
      }
    }
    return res.reasonPhrase!;
  }
}
