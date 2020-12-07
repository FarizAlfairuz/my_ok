import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  int _currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFFE93649)),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Cart',
          style: TextStyle(
            fontSize: 25,
            color: Color(0xFFE93649),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              elevation: 5.0,
              margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: ListTile(
                  leading: Container(
                      height: 60,
                      width: 60,
                      child: Image.asset(
                        'assets/images/banner/botol.png',
                        fit: BoxFit.cover,
                      )),
                  title: Text(
                    'Drinkware Imagination',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Rp 55.000,00-',
                    // overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14),
                  ),
                  trailing: Icon(
                    Icons.delete,
                    color: Color(0xFFE93649),
                  ),
                ),
              ),
            )
          ],
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
