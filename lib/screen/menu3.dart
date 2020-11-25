import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int _currentIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: 30, right: 30),
        child: BottomNavyBar(
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
