import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.09),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: TextField(
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              contentPadding: new EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 10.0),
              enabledBorder: OutlineInputBorder(
                borderSide: new BorderSide(color: Colors.white),
              ),
//          border: InputBorder.none(),
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(Icons.search),
              ),
              hintText: 'Pozisyon adı, teknoloji adı'),
        ));
  }
}
