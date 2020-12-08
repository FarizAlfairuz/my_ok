import 'package:flutter/material.dart';
import 'package:my_ok/screen/menu3.dart';

class BestSeller extends StatefulWidget {
  @override
  _BestSellerState createState() => _BestSellerState();
}

class _BestSellerState extends State<BestSeller> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
      },
      child: Card(
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
      ),
    );
  }
}
