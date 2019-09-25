import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';

class ImageWidget extends StatefulWidget {
  @override
  _ImageWidgetState createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  File _image;
  _takePhoto() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
    this._uploadImage(image);
  }

  _openGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
    this._uploadImage(image);
  }

  Widget _buildImage() {
    if (_image == null) {
      return Text("请选择图片");
    } else {
      return Container(
        width: 150,
        height: 150,
        child: Image.file(this._image),
      );
    }
  }

  _uploadImage(_imageDir) async {
    FormData formData = FormData.from({
      "name": "wangcai",
      "age": 26,
      "file": UploadFileInfo(_imageDir, "xxx.jpg")
    });
    var imageinfo = Dio().post("http://192.168.1.148:3000/upload",data: formData);
    print(imageinfo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: _takePhoto,
            child: Text("拍照"),
          ),
          RaisedButton(
            onPressed: _openGallery,
            child: Text("选择图库照片"),
          ),
          _buildImage()
        ],
      ),
    );
  }
}
