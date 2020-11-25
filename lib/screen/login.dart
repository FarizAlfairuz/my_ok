import 'package:flutter/material.dart';
import 'package:my_ok/layout.dart';
import 'package:flutter/gestures.dart';
import 'package:my_ok/screen/menu1.dart';
import 'register.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  String _email, _password;
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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          child: Stack(
            children: <Widget>[
              //decoration
              Positioned(
                bottom: SizeConfig.blockHorizontal * -58,
                left: SizeConfig.blockHorizontal * -107,
                child: Image(
                  image:
                      AssetImage('assets/images/login_register/decoration.png'),
                  fit: BoxFit.fitHeight,
                  height: SizeConfig.blockVertical * 90,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  //logo
                  Align(
                    alignment: Alignment(-0.9, 0),
                    child: Container(
                      margin:
                          EdgeInsets.only(top: SizeConfig.blockVertical * 8),
                      color: Colors.grey,
                      height: SizeConfig.blockVertical * 15,
                      width: SizeConfig.blockHorizontal * 40,
                    ),
                  ),
                  //welcome
                  Align(
                    alignment: Alignment(-0.9, 0),
                    child: Container(
                      margin:
                          EdgeInsets.only(top: SizeConfig.blockVertical * 2),
                      child: Text(
                        'Welcome Back,\nCreative Friend',
                        style: TextStyle(
                          fontSize: 24,
                          color: Color(0xFF808080),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: SizeConfig.blockVertical * 10,
                  ),

                  //form
                  Form(
                    key: formKey,
                    onChanged: () => setState(
                        () => _btnEnabled = formKey.currentState.validate()),
                    child: Column(
                      children: <Widget>[
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
                      backgroundColor: _btnEnabled ? Color(0xFFE63946) : Colors.grey,
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

                  //have account
                  RichText(
                    text: TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFFA1A1A1),
                        fontWeight: FontWeight.bold,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Sign Up',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RegisterScreen(),
                                  ));
                            },
                          style: TextStyle(
                            color: Color(0xFFE93649),
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
