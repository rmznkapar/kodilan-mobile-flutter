import 'package:flutter/material.dart';
import 'package:kodilan/uis/jobsbox.dart';
import 'package:kodilan/uis/titlebox.dart';
class Search extends StatefulWidget {
  final String link;
  final String searchFor;
  const Search(this.link, this.searchFor);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
            child: Text("Kodilan"),
          )),
      body: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 5.0, left: 20.0, right: 20.0),
            child: Container(
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        TitleBox(title:  widget.searchFor + ' İlanlar'),
                      ],
                    ),
                  ),
                  JobsBox(link: widget.link),
                ],
              ),
            ),
          )), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
