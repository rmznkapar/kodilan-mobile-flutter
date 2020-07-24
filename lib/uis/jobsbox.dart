import 'package:flutter/material.dart';
import 'package:kodilan/uis/jobcard.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class JobsBox extends StatelessWidget {
  List jobList(data) {
    var jobData = jsonDecode(data)['data'];
    print(jobData.length.toString());
    var jobList = new List<Widget>.generate(25, (i) {
      print(jobData[i].runtimeType);
      return JobCard(data: jobData[i]);
    });
    return jobList;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: http.get("https://api.kodilan.com/posts?get=25&period=monthly"),
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
