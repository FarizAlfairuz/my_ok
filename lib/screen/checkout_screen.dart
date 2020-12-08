import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_ok/layout.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:path/path.dart';


class CheckoutCustom extends StatefulWidget {
  @override
  _CheckoutCustomState createState() => _CheckoutCustomState();
}

class _CheckoutCustomState extends State<CheckoutCustom> {

  File _imageFile;

  final picker = ImagePicker();

  Future pickImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      _imageFile = File(pickedFile.path);
    });
  }

  Future uploadImageToFirebase(BuildContext context) async {
    String fileName = basename(_imageFile.path);
    
    StorageReference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('uploads/$fileName');
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(_imageFile);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    taskSnapshot.ref.getDownloadURL().then(
          (value) => print("Done: $value"),
        );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFFE93649)),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Check Out',
          style: TextStyle(
            fontSize: 25,
            color: Color(0xFFE93649),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              Container(
                height: SizeConfig.blockVertical * 20,
                width: SizeConfig.blockHorizontal * 70,
                color: Colors.amber,
              ),
              Align(
                alignment: Alignment(-0.85, 0),
                child: Container(
                  margin: EdgeInsets.only(top: SizeConfig.blockVertical * 2),
                  child: Text(
                    'Upload Mockup',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: SizeConfig.blockVertical * 20,
                width: SizeConfig.blockHorizontal * 90,
                decoration: BoxDecoration(
                  // color: Colors.amber,
                  border: Border.all(color: Colors.red, width: 3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Icon(
                    Icons.image,
                    color: Colors.red,
                    size: 40,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
