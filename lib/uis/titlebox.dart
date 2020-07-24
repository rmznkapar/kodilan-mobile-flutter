import 'package:flutter/material.dart';

class TitleBox extends StatelessWidget {
  TitleBox({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 35.0),
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 21,
        ),
      ),
    );
  }
}
