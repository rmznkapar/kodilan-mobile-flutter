import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class DescBox extends StatelessWidget {
  DescBox({Key key, this.desc}) : super(key: key);
  final String desc;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Html(data: desc),
    );
  }
}
