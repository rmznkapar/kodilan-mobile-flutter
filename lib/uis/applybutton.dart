import 'package:flutter/material.dart';

class ApplyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(bottom: 5.0),
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(width: 0.5, color: Color(0XFFD8D8DE)),
            color: Colors.green[600],
          ),
          child: Text('Bu İşe Başvur',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: 16,
              ))),
    );
  }
}
