import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class JobCard extends StatelessWidget {
  JobCard({Key key, this.data}) : super(key: key);
  final data;

  @override
  Widget build(BuildContext context) {
    print(data['position']);
//    List tags =
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 50,
                  maxWidth: 100,
                ),
                child: Container(
                  width: 50,
                  height: 50,
                  child: FadeInImage(
                      image: NetworkImage(data['company']['logo']),
                      placeholder: AssetImage('assets/empty-company-logo.png')),
                ),
              ),
              Expanded(
                child: Container(
                    margin: EdgeInsets.only(left: 15.0),
                    child: Text(
                      data['position'],
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    )),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text(
              data['company']['name'] + " | " + data['location'],
              style: TextStyle(color: Color(0XFF757575)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //data['tags'].length > 4 ? 4 : data['tags'].length
                  children: List<Widget>.generate(data['tags'].length, (int i) {
                    return Container(
                        padding: EdgeInsets.all(10.0),
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Color(0XFFF4F7FF),
                        ),
                        child: Text(data['tags'][i]['name'],
                            style: TextStyle(
                                color: Color(0XFF8A90A5),
                                fontWeight: FontWeight.w600)));
                  })
//            [
//              Container(child: Text(data['tags'][0]['name'])),
//              Container(child: Text(data['tags'][1]['name'] ?? 'red')),
//              Container(child: Text(data['tags'][2]['name'] ?? 'red'))
//            ],
                  ),
            ),
          ),
        ],
      ),
    ));
  }
}
