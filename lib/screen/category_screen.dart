import 'package:flutter/material.dart';
import 'package:my_ok/screen/checkout_screen.dart';
import 'package:my_ok/screen/menu2.dart';
import 'checkout.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final List<String> _listItem = [
    'assets/images/items/item1.jpg',
    'assets/images/items/item2.jpg',
    'assets/images/items/item3.jpg',
    'assets/images/items/item2.jpg',
    'assets/images/items/item1.jpg',
    'assets/images/items/item3.jpg',
    'assets/images/items/item1.jpg',
    'assets/images/items/item2.jpg',
  ];

  final List<String> _listNama = [
    'Masker 1',
    'Masker 2',
    'Masker 3',
    'Masker 4',
    'Masker 5',
    'Masker 6',
    'Masker 7',
    'Masker 8',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFFE93649)),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Image.asset('assets/images/categories/mask.png'),
                title: Text(
                  'New Normal Kit',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'Wear your own custom New Normal Kit',
                  // overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
            Expanded(
              child: GridView.count(
                padding: EdgeInsets.all(20),
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: _listItem
                    .map(
                      (item) => Card(
                        color: Colors.transparent,
                        elevation: 0,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Checkout()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: AssetImage(item),
                                    fit: BoxFit.cover)),
                            child: Transform.translate(
                              offset: Offset(0, 65),
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 63),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white.withOpacity(0.8)),
                                child: Center(
                                  child: Text(
                                    'Masker',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
