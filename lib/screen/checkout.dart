import 'package:flutter/material.dart';
import 'package:my_ok/layout.dart';
import 'package:my_ok/screen/checkout_screen.dart';

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Color(0xFFE93649)),
        backgroundColor: Colors.white,
        elevation: 0.0,
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Container(
                height: 260,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                    image: AssetImage('assets/images/items/item1.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                height: SizeConfig.blockHorizontal * 95,
                width: SizeConfig.screenWidth,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(1, 3),
                    )
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Masker', style: TextStyle(fontSize: 32)),
                    SizedBox(height: 20),
                    Text('status barang',
                        style: TextStyle(fontSize: 15, color: Colors.green)),
                    SizedBox(height: 20),
                    Text('lorem ipsum'),
                    SizedBox(height: 18),
                    Row(
                      children: [
                        Container(
                          height: 40,
                          width: 112,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Center(child: Text('1')),
                        ),
                        Container(
                          height: 40,
                          width: 110,
                          // color: Colors.grey,
                        ),
                        Text('Rp 55.000', style: TextStyle(fontSize: 28)),
                      ],
                    ),
                    SizedBox(height: 20),
                    //button
                    Row(
                      children: [
                        SizedBox(
                          height: SizeConfig.blockVertical * 8,
                          width: SizeConfig.blockVertical * 38,
                          child: FloatingActionButton.extended(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CheckoutCustom()));
                            },
                            backgroundColor: Colors.red,
                            label: Text(
                              'Check Out',
                            ),
                          ),
                        ),
                        SizedBox(width: 50),
                        Icon(
                          Icons.add_shopping_cart,
                          size: 36,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
