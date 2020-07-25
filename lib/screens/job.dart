import 'package:flutter/material.dart';
import 'package:kodilan/uis/headbox.dart';
import 'package:kodilan/uis/applybutton.dart';
import 'package:kodilan/uis/descbox.dart';

class Job extends StatefulWidget {
  final data;

  const Job(this.data);

  @override
  _JobState createState() => _JobState();
}

class _JobState extends State<Job> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
        child: Text(widget.data['company']['name'],
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
            )),
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
                    HeadBox(
                        position: widget.data['position'],
                        image: widget.data['company']['logo'],
                        tags: widget.data['tags'],
                        location: widget.data['location'],
                        company: widget.data['company']
                    ),
                    DescBox(desc: widget.data['description']),
                    SizedBox(height: 75.0,)
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
      floatingActionButton: ApplyButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
