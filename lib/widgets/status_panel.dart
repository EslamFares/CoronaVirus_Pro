
import 'package:flutter/material.dart';

import '../constants.dart';

class StatusPanel extends StatelessWidget {
  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;
  final double width;

  const StatusPanel(
      {Key key, this.panelColor, this.textColor,this.width, this.title, this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
        color: cSecColor,
        border: Border.all(color: panelColor, width: 4),
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            offset: Offset(2.0, 2.0), //(x,y)
            blurRadius: 6.0,
          ),
        ],
      ),
      margin: EdgeInsets.all(10),
      height: 70,
      width: width==null?MediaQuery.of(context).size.width/2.1:width,//width / 2.1
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            title.toUpperCase(),
            style: TextStyle(
                color: textColor, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            count,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ],
      ),
    );
  }
}