import 'package:flutter/material.dart';
import 'package:kodilan/screens/search.dart';

class JobCard extends StatelessWidget {
  JobCard({Key key, this.data}) : super(key: key);
  final data;

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.only(bottom: 15.0),
        child: GestureDetector(
          onTap: () {},
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
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffe9ecf5)),
                            borderRadius: BorderRadius.circular(10.0),
                            color: Color(0XFFF4F7FF),
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
//                              child: Image.network(data['company']['logo'])
                          )),
                    ),
                    Expanded(
                      child: Container(
                          margin: EdgeInsets.only(left: 15.0),
                          child: Text(
                            data['position'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
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
                  child: Align(
                    alignment: Alignment.topRight,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          //data['tags'].length > 4 ? 4 : data['tags'].length
                          children: List<Widget>.generate(data['tags'].length,
                              (int i) {
                            return GestureDetector(
                              onTap: () => {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return Search('https://api.kodilan.com/tags/'+data['tags'][i]['slug']+'/posts');
                                }))
                              },
                              child: Container(
                                  padding: EdgeInsets.all(10.0),
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: Color(0XFFF4F7FF),
                                  ),
                                  child: Text(data['tags'][i]['name'],
                                      style: TextStyle(
                                          color: Color(0XFF8A90A5),
                                          fontWeight: FontWeight.w600))),
                            );
                          })),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
