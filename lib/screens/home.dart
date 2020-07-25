import 'package:flutter/material.dart';
import 'package:kodilan/uis/searchbar.dart';
import 'package:kodilan/uis/titlebox.dart';
import 'package:kodilan/uis/jobsbox.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
        child: Text("Kodilan"),
      )),
      body: Center(
          child: Padding(
        padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        child: Container(
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    SearchBar(),
                    TitleBox(title: "En Son Eklenen İlanlar"),
                  ],
                ),
              ),
              JobsBox(link: "https://api.kodilan.com/posts?get=25&period=monthly"),
            ],
          ),
        ),
      )), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}