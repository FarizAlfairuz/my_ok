import 'package:flutter/material.dart';
import 'package:my_ok/layout.dart';
import 'package:my_ok/screen/landingpage.dart';
import 'package:flutter/gestures.dart';
import 'login.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
              Positioned(
                bottom: SizeConfig.blockHorizontal * -58,
                left: SizeConfig.blockHorizontal * -107,
                child: Image(
                  image: AssetImage('assets/images/login_register/decoration.png'),
                  fit: BoxFit.fitHeight,
                  height: SizeConfig.blockVertical * 90,
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
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
                  // Align(
                  //   alignment: Alignment(-0.9, 0),
                  //   child: Container(
                  //     margin:
                  //         EdgeInsets.only(top: SizeConfig.blockVertical * 2),
                  //     child: Text(
                  //       'Welcome Back,\nCreative Friend',
                  //       style: TextStyle(
                  //         fontSize: 24,
                  //         color: Color(0xFF808080),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: SizeConfig.blockVertical,
                  ),

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
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.blockVertical * 5,
                  ),

                  //button
                  SizedBox(
                    height: 80,
                    width: 80,
                    child: FloatingActionButton(
                      backgroundColor: Color(0xFFE63946),
                      child: Icon(Icons.navigate_next),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LandingPage()),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.blockVertical * 5,
                  ),

                  //have account
                  RichText(
                    text: TextSpan(
                      text: "Have an account? ",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFFA1A1A1),
                        fontWeight: FontWeight.bold,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Log In',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginScreen(),
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
