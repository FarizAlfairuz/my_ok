import 'package:flutter/material.dart';
import 'package:my_ok/layout.dart';

class FormCheckout extends StatefulWidget {
  @override
  _FormCheckoutState createState() => _FormCheckoutState();
}

class _FormCheckoutState extends State<FormCheckout> {
  int groupValue;

  String _alamat, _nohp;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFFE93649)),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Form Check Out',
          style: TextStyle(
            fontSize: 25,
            color: Color(0xFFE93649),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //alamat
            Container(
              margin: EdgeInsets.all(20),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Address",
                  labelStyle: TextStyle(
                    color: Color(0xFF1D3557),
                    fontWeight: FontWeight.bold,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Colors.grey,
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
                onSaved: (input) => _alamat = input,
                // controller: _nameController,
              ),
            ),

            //no hp
            Container(
              margin: EdgeInsets.all(20),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Nomor HP",
                  labelStyle: TextStyle(
                    color: Color(0xFF1D3557),
                    fontWeight: FontWeight.bold,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Colors.grey,
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
                onSaved: (input) => _nohp = input,
                // controller: _emailController,
              ),
            ),

            Align(
              alignment: Alignment(-0.85, 0),
              child: Container(
                margin: EdgeInsets.only(top: SizeConfig.blockVertical * 2),
                child: Text(
                  'Courier',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),

            Container(
              height: SizeConfig.blockVertical * 10,
              width: SizeConfig.blockHorizontal * 90,
              // color: Colors.blue,
              child: Row(
                children: [
                  Radio(
                    activeColor: Colors.red,
                    value: 1,
                    groupValue: groupValue,
                    onChanged: (T) {
                      print(T);
                      setState(() {
                        groupValue = T;
                      });
                    },
                  ),
                  Text('JNE'),
                  Radio(
                    activeColor: Colors.red,
                    value: 2,
                    groupValue: groupValue,
                    onChanged: (T) {
                      print(T);
                      setState(() {
                        groupValue = T;
                      });
                    },
                  ),
                  Text('TIKI'),
                  Radio(
                    activeColor: Colors.red,
                    value: 3,
                    groupValue: groupValue,
                    onChanged: (T) {
                      print(T);
                      setState(() {
                        groupValue = T;
                      });
                    },
                  ),
                  Text('JIN'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
