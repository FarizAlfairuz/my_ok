import 'package:flutter/material.dart';
import 'package:my_ok/layout.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isSearchig = false; //search bar is tapped
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: RichText(
          text: TextSpan(
            text: "Explore ",
            style: TextStyle(
              fontSize: 25,
              color: Color(0xFFE93649),
              fontWeight: FontWeight.bold,
            ),
            children: <TextSpan>[
              TextSpan(
                text: 'For You',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
      body: Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: SizeConfig.blockVertical * 5),
              //search bar
              Container(
                height: SizeConfig.blockVertical * 8,
                width: SizeConfig.blockHorizontal * 90,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.search,
                    color: Color(0xFFE93649),
                    size: 30,
                  ),
                  title: !_isSearchig
                      ? Text(
                          'Search Here...',
                          style: TextStyle(
                            color: Color(0xFFE93649),
                          ),
                        )
                      : TextField(
                          style: TextStyle(
                            color: Color(0xFFE93649),
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: 'Search Here...',
                            hintStyle: TextStyle(
                              color: Color(0xFFE93649),
                            ),
                          ),
                        ),
                  onTap: () {
                    setState(() {
                      _isSearchig = !_isSearchig;
                    });
                  },
                ),
              ),

              SizedBox(height: SizeConfig.blockVertical * 5),
              //banner
              Container(
                height: SizeConfig.blockVertical * 20,
                width: SizeConfig.blockHorizontal * 90,
                // color: Colors.blue,
                child: Image(
                  image: AssetImage('assets/images/banner/banner1.png'),
                  fit: BoxFit.fill,
                ),
              ),

              SizedBox(height: SizeConfig.blockVertical * 5),

              //list category
              Container(
                height: SizeConfig.blockVertical * 20,
                width: SizeConfig.screenWidth,
                // color: Colors.red,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    categoryCard(),
                    categoryCard(),
                    categoryCard(),
                    categoryCard(),
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment(-0.85, 0),
                    child: Container(
                      margin:
                          EdgeInsets.only(top: SizeConfig.blockVertical * 2),
                      child: Text(
                        'Best Seller',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  bestSeller(),
                  bestSeller(),
                  bestSeller(),
                  bestSeller(),
                  bestSeller(),
                ],
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

categoryCard() {
  return Container(
    margin: EdgeInsets.all(10),
    width: SizeConfig.blockVertical * 15,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 5,
          offset: Offset(1, 3),
        )
      ],
    ),
    child: Column(
      children: <Widget>[
        Container(
          height: SizeConfig.blockVertical * 8,
          margin: EdgeInsets.fromLTRB(10, 12, 10, 15),
          child: Image(
            image: AssetImage('assets/images/categories/stationery.png'),
            fit: BoxFit.cover,
          ),
        ),
        Text(
          'Stationery',
          style: TextStyle(
            fontSize: 14,
          ),
        ),
      ],
    ),
  );
}

bestSeller() {
  return Card(
    elevation: 5.0,
    margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
    child: Padding(
      padding: EdgeInsets.all(10.0),
      child: ListTile(
        leading: Image.asset('assets/images/categories/mask.png'),
        title: Text(
          'New Normal Kit',
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          'Wear your own custom New Normal Kit',
          // overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 14),
        ),
        trailing: Icon(Icons.more_vert),
      ),
    ),
  );
}
