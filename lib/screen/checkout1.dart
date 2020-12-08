import 'package:flutter/material.dart';
import 'package:my_ok/layout.dart';

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
        iconTheme: IconThemeData(color: Color(0xFFE93649)),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Container(height: 260, width: 300, color: Colors.blue),
              Container(
                padding: EdgeInsets.all(20),
                height: SizeConfig.blockHorizontal * 95,
                width: SizeConfig.screenWidth,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('ini nama produk', style: TextStyle(fontSize: 32)),
                    SizedBox(height: 20),
                    Text('status barang',
                        style: TextStyle(fontSize: 15, color: Colors.green)),
                    SizedBox(height: 20),
                    Text(
                        'Kustomisasi botol minum kamu dengan desain yang cantik yang kamu buat sendiri dengan penuh kreasi. Ukuran : 340mL'),
                    SizedBox(height: 18),
                    Row(
                      children: [
                        Container(
                          height: 40,
                          width: 112,
                          color: Colors.white,
                        ),
                        Container(
                          height: 40,
                          width: 110,
                          color: Colors.grey,
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
                            onPressed: null,
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
