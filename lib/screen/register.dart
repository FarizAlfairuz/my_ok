import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_ok/layout.dart';
import 'package:my_ok/screen/login.dart';
import 'package:my_ok/screen/menu1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // RegisterActivityPresenter presenter;
  // TextEditingController _nameController = TextEditingController();
  // TextEditingController _emailController = TextEditingController();
  // TextEditingController _passController = TextEditingController();
  // TextEditingController _cPassController = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  //   presenter = RegisterActivityPresenter(this);
  // }

  // void doRegister(
  //     String name, String email, String password, String cPassword) {
  //   if (name.isNotEmpty &&
  //       email.isNotEmpty &&
  //       password.isNotEmpty &&
  //       cPassword == password) {
  //     if (name.length >= 5) {
  //       if (password.length >= 8) {
  //         presenter?.register(name, email, password);
  //       } else {
  //         toast("Password at least eight letter");
  //       }
  //     } else {
  //       toast("Name at least five letter");
  //     }
  //   } else {
  //     toast("Please fill all forms");
  //   }
  // }

  final formKey = GlobalKey<FormState>();
  String _nama, _email, _password, _confirmPw;
  bool _btnEnabled = false;

  route() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(SizeConfig.blockVertical * 15),
        child: Container(
          margin: EdgeInsets.only(top: SizeConfig.blockVertical * 5),
          child: AppBar(
            centerTitle: true,
            title: Text(
              'Create New\nAcount',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 29,
              ),
            ),
            backgroundColor: Colors.white,
            elevation: 0.0,
            iconTheme: IconThemeData(
              color: Colors.grey,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: SizeConfig.blockVertical,
              ),
              //profile image
              Container(
                height: SizeConfig.blockVertical * 15,
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: SizeConfig.blockVertical * 10,
                      width: SizeConfig.blockVertical * 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF1D3557),
                      ),
                    ),
                    Positioned(
                      left: 2,
                      child: Icon(
                        Icons.person,
                        color: Color(0xFFE63946),
                        size: 65,
                      ),
                    ),
                    Positioned(
                      bottom: 18,
                      left: 19,
                      child: Icon(
                        Icons.add_circle,
                        size: 30,
                        color: Color(0xFFE63946),
                      ),
                    )
                  ],
                ),
              ),

              // SizedBox(
              //   height: SizeConfig.blockVertical * 5,
              // ),

              //form
              Form(
                key: formKey,
                onChanged: () => setState(
                    () => _btnEnabled = formKey.currentState.validate()),
                child: Column(
                  children: <Widget>[
                    //name
                    Container(
                      margin: EdgeInsets.all(10),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Full Name",
                          labelStyle: TextStyle(
                            color: Color(0xFF1D3557),
                            fontWeight: FontWeight.bold,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Color(0xFF1D3557),
                              width: 2.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Color(0xFF1D3557),
                              width: 2.0,
                            ),
                          ),
                          focusColor: Color(0xFF1D3557),
                        ),
                        onSaved: (input) => _nama = input,
                        // controller: _nameController,
                      ),
                    ),

                    //email
                    Container(
                      margin: EdgeInsets.all(10),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Email",
                          labelStyle: TextStyle(
                            color: Color(0xFF1D3557),
                            fontWeight: FontWeight.bold,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Color(0xFF1D3557),
                              width: 2.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Color(0xFF1D3557),
                              width: 2.0,
                            ),
                          ),
                          focusColor: Color(0xFF1D3557),
                        ),
                        onSaved: (input) => _email = input,
                        // controller: _emailController,
                      ),
                    ),

                    //password
                    Container(
                      margin: EdgeInsets.all(10),
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: TextStyle(
                            color: Color(0xFF1D3557),
                            fontWeight: FontWeight.bold,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Color(0xFF1D3557),
                              width: 2.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Color(0xFF1D3557),
                              width: 2.0,
                            ),
                          ),
                          focusColor: Color(0xFF1D3557),
                        ),
                        onSaved: (input) => _password = input,
                        // controller: _passController,
                      ),
                    ),

                    //confirm password
                    Container(
                      margin: EdgeInsets.all(10),
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Confirm Password",
                          labelStyle: TextStyle(
                            color: Color(0xFF1D3557),
                            fontWeight: FontWeight.bold,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Color(0xFF1D3557),
                              width: 2.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Color(0xFF1D3557),
                              width: 2.0,
                            ),
                          ),
                          focusColor: Color(0xFF1D3557),
                        ),
                        onSaved: (input) => _confirmPw = input,
                        // controller: _cPassController,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: SizeConfig.blockVertical * 5,
              ),

              //button
              SizedBox(
                height: SizeConfig.blockVertical * 10,
                width: SizeConfig.blockVertical * 10,
                child: FloatingActionButton(
                  backgroundColor:
                      _btnEnabled ? Color(0xFFE63946) : Colors.grey,
                  child: Icon(
                    Icons.input,
                    size: 30,
                  ),
                  onPressed: _btnEnabled ? signUp : null,
                ),
              ),
              SizedBox(
                height: SizeConfig.blockVertical * 5,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void signUp() async {
    final formState = formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        UserCredential user = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: _email, password: _password);
        Navigator.of(context).pop();
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
        //langsung ke loginpage
      } catch (e) {
        print(e.message);
      }
    }
  }
}
