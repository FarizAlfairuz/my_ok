import 'package:flutter/material.dart';
import 'package:my_ok/layout.dart';
import 'package:my_ok/screen/menu2.dart';

class CategoryCard extends StatefulWidget {

  List value;
  CategoryCard({this.value});

  @override
  _CategoryCardState createState() => _CategoryCardState(value);
}

class _CategoryCardState extends State<CategoryCard> {

  List value;
  _CategoryCardState(this.value);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: () {
        print(value);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Cart()));
      },
      child: Container(
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
              widget.value[1] ?? "This is null",
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
