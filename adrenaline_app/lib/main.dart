// ignore_for_file: unnecessary_new

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Image',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyImagePicker(title: 'Upload image'),
    );
  }
}

class MyImagePicker extends StatefulWidget {
  MyImagePicker({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyImagePickerState createState() => _MyImagePickerState();
}

class _MyImagePickerState extends State<MyImagePicker> {
  final ImagePicker _picker = ImagePicker();

  Future<String?> uploadImage(XFile imageFile) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('http://10.0.2.2:20122/weapons'));
    request.fields['name'] = "Starlight Buster 8";
    request.fields['description'] = "Silver";
    request.fields['damage'] = "2d6";
    request.fields['bonus'] = "2";
    request.fields['idType'] = "1";
    request.headers["Authorization"] =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJBZG1pbiIsInJvbGUiOiJBZG1pbiIsImlhdCI6MTY1NzY4MDc1MX0.DkFNRRJTLqhfJ9-L2smRDG5UWNl7vKTKmZXT-JfBpC4";

    var stream = new http.ByteStream(Stream.castFrom(imageFile.openRead()));
    // get file length
    var length = await imageFile.length(); //imageFile is your image file

    // multipart that takes file
    var multipartFileSign = new http.MultipartFile('image', stream, length,
        filename: basename(imageFile.path),
        contentType: new MediaType('image', extension(imageFile.path)));
    request.files.add(multipartFileSign);
    var res = await request.send();
    return res.reasonPhrase;
  }

  void _pickImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile == null) return;
      uploadImage(pickedFile).then((value) {
        print(value);
      });
    } catch (e) {
      print("Image picker error ");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickImage,
        tooltip: 'Pick Image from gallery',
        child: const Icon(Icons.photo_library),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
