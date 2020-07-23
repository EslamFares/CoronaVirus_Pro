import 'dart:ui';
import 'package:coronavirus_pro/screens/country_page.dart';
import 'package:coronavirus_pro/screens/faqs.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants.dart';
import '../data_source.dart';

// ignore: non_constant_identifier_names
ClipPath imgHeader({@required BuildContext context,@required List CountriesDAta}) {
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
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CountryPage(CountriesData: CountriesDAta,)));
              },
              child: Container(
                  margin: EdgeInsets.only(top: 30, right: 20),
                  child: Icon(Icons.location_on,color: Colors.amber,size: 35,)),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
                margin: EdgeInsets.only(top: 30, left: 20),
                child: GestureDetector(
                  onTapUp: (details) {
                    //==================== to return showMenu in spchial position ===========
                    double dx = details.globalPosition.dx;
                    double dy = details.globalPosition.dy;
                    double dR = (MediaQuery.of(context).size.width) - dx;
                    double dB = (MediaQuery.of(context).size.height) - dy;
                    return showMenu(
                      elevation: 10,
                      color: cSecColor,
                      context: context,
                      position: RelativeRect.fromLTRB(dx, dy, dR, dB),
                      items: <PopupMenuItem<String>>[
                        PopupMenuItem<String>(
                            child: GestureDetector(
                              child: Text(
                                'FQAS',
                                style: TextStyle(color: Colors.white),
                              ),
                              onTap: () {
                                Navigator.pop(context);
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>FqaPage()));
                                print(1111111111111);
                              },
                            ),
                            value: 'test1'),
                        PopupMenuItem<String>(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                                launch('https://covid19responsefund.org/en/');
                                print('MYTH BUSTERS');
                              },
                              child: Text(
                                'MYTH BUSTERS',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            value: 'test2'),
                        PopupMenuItem<String>(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                                launch('https://www.who.int/indonesia/news/novel-coronavirus/mythbusters');
                                print('DONATE');
                              },
                              child: Text(
                                'DONATE',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            value: 'test3'),
                      ],
                    );
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
