import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

var image;
File profileimage;

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              child: profileimage != null
                  ? Image.file(profileimage)
                  : Text("no image Selected"),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          FloatingActionButton(
            child: Icon(Icons.camera),
            onPressed: () {
              getGalleryImage();
            },
          ),
        ],
      ),
    );
  }

  Future getGalleryImage() async {
    image = await ImagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 500, maxWidth: 500);

    setState(() {
      profileimage = image;
    });
  }
}
