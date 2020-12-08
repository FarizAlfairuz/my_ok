import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_ok/layout.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:my_ok/screen/form_checkout.dart';
import 'package:my_ok/screen/menu1.dart';
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
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _imageFile = File(pickedFile.path);
    });
  }

  Future uploadImageToFirebase(BuildContext context) async {
    String fileName = basename(_imageFile.path);
    Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('uploads/$fileName');
    UploadTask uploadTask = firebaseStorageRef.putFile(_imageFile);
    TaskSnapshot taskSnapshot = await uploadTask;
    taskSnapshot.ref.getDownloadURL().then(
          (value) => print("Done: $value"),
        );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
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
              GestureDetector(
                onTap: pickImage,
                child: Container(
                  height: SizeConfig.blockVertical * 20,
                  width: SizeConfig.blockHorizontal * 90,
                  decoration: BoxDecoration(
                    // color: Colors.amber,
                    border: Border.all(color: Colors.red, width: 3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: _imageFile != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.file(
                            _imageFile,
                            fit: BoxFit.cover,
                          ),
                        )
                      : Center(
                          child: Icon(
                            Icons.image,
                            color: Colors.red,
                            size: 40,
                          ),
                        ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: SizeConfig.blockVertical * 10,
                width: SizeConfig.blockHorizontal * 80,
                // color: Colors.red,
                child: Text(
                  'Note : (Masukan gambar dengan format .ai, .jpg, .JPG, .png, .jpeg, .jpeg file)',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  uploadImageToFirebase(context);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FormCheckout()));
                },
                child: Container(
                  height: SizeConfig.blockVertical * 8,
                  width: SizeConfig.blockHorizontal * 70,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    // border: Border.all(color: Colors.red, width: 3),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                      child: Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                    ),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
