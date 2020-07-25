import 'package:flutter/material.dart';
import 'package:kodilan/screens/search.dart';

class HeadBox extends StatelessWidget {
  HeadBox({Key key, this.position, this.tags, this.image, this.location, this.company}) : super(key: key);
  final String position;
  final List tags;
  final String image;
  final String location;
  final company;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            margin: EdgeInsets.symmetric(vertical: 20.0),
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffe9ecf5)),
              borderRadius: BorderRadius.circular(15.0),
              color: Color(0XFFF4F7FF),
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(image))),
        Container(
          child: Text(
            position,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15.0, bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () => {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return Search(
                        'https://api.kodilan.com/companies/' +
                            company['slug'] +
                            '/posts',
                        company['name']);
                  }))
                },
                child: Text(
                  company['name'],
                  style: TextStyle(color: Color(0XFF757575)),
                ),
              ),
              Text("  |  "),
              GestureDetector(
                onTap: () => {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return Search(
                        'https://api.kodilan.com/search?location=' +
                            location,
                        location);
                  }))
                },
                child: Text(
                  location,
                  style: TextStyle(color: Color(0XFF757575)),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 15.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(tags.length, (int i) {
                return GestureDetector(
                    onTap: () => {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return Search(
                            'https://api.kodilan.com/tags/' +
                                tags[i]['slug'] +
                                '/posts',
                            tags[i]['name']);
                      }))
                    },
                  child: Container(
                      padding: EdgeInsets.all(10.0),
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(width: 0.5,color: Color(0XFFD8D8DE)),
                        color: Colors.white,
                      ),
                      child: Text(tags[i]['name'],
                          style: TextStyle(
//                              color: Color(0XFF8A90A5),
                          color: Colors.black,
                              fontWeight: FontWeight.w600))),
                );
              })),
        ),
      ],
    );
  }
}
