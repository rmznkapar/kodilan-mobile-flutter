import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class JobCard extends StatelessWidget {
  JobCard({Key key, this.data}) : super(key: key);
  final data;

  @override
  Widget build(BuildContext context) {
    print(data['position']);
    return Card(
        child: Column(
      children: <Widget>[
        ListTile(
          leading: FadeInImage(image: NetworkImage(data['company']['logo']), placeholder: AssetImage('assets/empty-company-logo.png')),
              title: Text(data['position']),
          subtitle: Wrap(
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.work, color: Colors.grey),
                  Text(data['company']['name']),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.location_on, color: Colors.grey),
                  Text(data['location']),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.computer, color: Colors.grey),
                  Text('Remote'),
                ],
              ),
            ],
          ),
          isThreeLine: true,
        ),
        ButtonBar(
          children: List<Widget>.generate(data['tags'].length, (int i) {
            if (i > 3) {
              return Container();
            }
            return FlatButton(
              color: Colors.grey,
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.blueAccent,
              child: Text(data['tags'][i]['name']),
              onPressed: () {
                /* ... */
              },
            );
          }),
//          children: <Widget>[
//            FlatButton(
//              child: const Text('BUY TICKETS'),
//              onPressed: () {
//                /* ... */
//              },
//            ),
//            FlatButton(
//              child: const Text('LISTEN'),
//              onPressed: () {
//                /* ... */
//              },
//            ),
//          ],
        ),
      ],
    ));
  }
}
