import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:my_ok/layout.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int _currentIndex = 2;

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
          'Profile',
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
        margin: EdgeInsets.all(SizeConfig.blockHorizontal * 5),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              //container atas
              Container(
                margin: EdgeInsets.all(10),
                height: SizeConfig.blockVertical * 20,
                // color: Colors.red,
                child: Row(
                  children: <Widget>[
                    //foto profil
                    Container(
                      margin:
                          EdgeInsets.only(left: SizeConfig.blockHorizontal * 7),
                      height: SizeConfig.blockVertical * 15,
                      width: SizeConfig.blockVertical * 15,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.yellow,
                      ),
                    ),
                    Spacer(),
                    //nama
                    Container(
                      margin: EdgeInsets.only(
                        right: SizeConfig.blockHorizontal * 10,
                      ),
                      padding: EdgeInsets.only(top: SizeConfig.blockHorizontal * 3, bottom: SizeConfig.blockHorizontal * 3),
                      height: SizeConfig.blockVertical * 15,
                      width: SizeConfig.blockHorizontal * 35,
                      // color: Colors.green,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          //nama user
                          Container(
                            child: Text(
                              'Sina Mustopa',
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF1D3557),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Spacer(),
                          //logout
                          Container(
                            child: Text(
                              'Log Out',
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFFE93649),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(25),
                height: SizeConfig.blockVertical * 100,
                width: SizeConfig.screenWidth,
                // color: Colors.blue,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF1D3557),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'sinamus@mustopa.com',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Container(
                        height: 1.0,
                        width: SizeConfig.screenWidth,
                        color: Colors.black,
                      ),
                    ),
                    
                    Text(
                      'Address',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF1D3557),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Perum Kentang Sina Mustopa belom bayar keripik',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Container(
                        height: 1.0,
                        width: SizeConfig.screenWidth,
                        color: Colors.black,
                      ),
                    ),

                    Text(
                      'Phone',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF1D3557),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '0869696969',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Container(
                        height: 1.0,
                        width: SizeConfig.screenWidth,
                        color: Colors.black,
                      ),
                    ),

                    Text(
                      'Nama Bapak',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF1D3557),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Irfan Satrio Mustopa',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Container(
                        height: 1.0,
                        width: SizeConfig.screenWidth,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: BottomNavyBar(
          showElevation: false,
          backgroundColor: Colors.white.withOpacity(0.0),
          selectedIndex: _currentIndex,
          onItemSelected: (index) {
            setState(() {
              _currentIndex = index;

              if (index == 0) {
                Navigator.of(context).pushReplacementNamed('/HOME');
              } else if (index == 1) {
                Navigator.of(context).pushReplacementNamed('/CART');
              } else if (index == 2) {
                Navigator.of(context).pushReplacementNamed('/PROFILE');
              }
            });
          },
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
                icon: Icon(Icons.home),
                title: Text(
                  'Home',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                activeColor: Color(0xFFE53947),
                inactiveColor: Color(0xFF677D9C)),
            BottomNavyBarItem(
                icon: Icon(Icons.shopping_cart),
                title: Text(
                  'Cart',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                activeColor: Color(0xFFE53947),
                inactiveColor: Color(0xFF677D9C)),
            BottomNavyBarItem(
                icon: Icon(Icons.person),
                title: Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                activeColor: Color(0xFFE53947),
                inactiveColor: Color(0xFF677D9C)),
          ],
        ),
      ),
    );
  }
}
