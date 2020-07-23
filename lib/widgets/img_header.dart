import 'dart:ui';

import 'package:flutter/material.dart';
import '../constants.dart';
import '../data_source.dart';

ClipPath imgHeader(BuildContext context) {
  return ClipPath(
    clipper: MyClipper(),
    child: Container(
      height: 320,
      decoration: BoxDecoration(color: cSecColor),
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('img/corona.jpg'),
            )),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
              child: Container(
                color: Colors.black.withOpacity(.5),
              ),
            ),
          ),

          Align(
            alignment: Alignment.topLeft,
            child: Container(
                margin: EdgeInsets.only(top: 30, left: 20),
                child: GestureDetector(
                  onTap: () {
                    print('oooooook');
                  },
                  child: Icon(
                    Icons.sort,
                    color: Colors.amber,
                    size: 35,
                  ),
                )),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: MediaQuery.of(context).size.width - 70,
              child: Center(
                child: Text(
                  DataSource.quote,
                  style: TextStyle(
                      height: 2,
                      color: Colors.white,
                      fontSize: 16,
                      letterSpacing: 1.1,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

void choiceAction(String choice) {
  print('is CCCCCCCCCCCCClicked');
}

class ConstantsPOP {
  static const String FAQs = 'FAQs';
  static const String FAQs2 = 'FAQs2';
  static const String FAQs3 = 'FAQs3';
  static const List<String> choices = <String>[FAQs, FAQs2, FAQs3];
}
//====================================================

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    var controllPoint = Offset(50, size.height);
    var endPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(
        controllPoint.dx, controllPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
