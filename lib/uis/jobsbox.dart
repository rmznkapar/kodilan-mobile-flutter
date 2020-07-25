import 'package:flutter/material.dart';
import 'package:kodilan/uis/jobcard.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class JobsBox extends StatelessWidget {
  JobsBox({Key key, this.link}) : super(key: key);
  final link;

  List jobList(data) {
    var jobData = jsonDecode(data)['data'];

    var jobList = new List<Widget>.generate(jsonDecode(data)['to'], (i) {
      print(jobData[i].runtimeType);
      return JobCard(data: jobData[i]);
    });
    return jobList;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: http.get(link),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done)
          return SliverList(
            delegate: SliverChildListDelegate(jobList(snapshot.data.body)),
          );
        else {
          return SliverToBoxAdapter(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
