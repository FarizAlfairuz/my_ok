import 'package:flutter/material.dart';
import 'package:my_ok/layout.dart';
import 'package:my_ok/screen/landingpage.dart';
import 'login.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  String _nama, _email, _password, _confirmPw;
  bool _btnEnabled = false;

  route() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LandingPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(SizeConfig.blockVertical * 25),
        child: Container(
          margin: EdgeInsets.only(top: SizeConfig.blockVertical * 8),
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
                  onPressed: _btnEnabled ? route : null,
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
}
