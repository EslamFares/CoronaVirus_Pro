import 'dart:convert';
import 'dart:ui';
import 'package:coronavirus_pro/widgets/img_header.dart';
import 'package:coronavirus_pro/widgets/most_effected.dart';
import 'package:coronavirus_pro/widgets/world_panel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map worldDAta;
  featchWorldWideData() async {
    http.Response response = await http.get('https://corona.lmao.ninja/v2/all');
    setState(() {
      worldDAta = json.decode(response.body);
    });
  }

  // ignore: non_constant_identifier_names
  List CountriesDAta;
  featchCountriesData() async {
    http.Response response =
        //?sort=cases added to apiLink to Sort Countries by Height Cases
        await http.get('https://corona.lmao.ninja/v2/countries?sort=cases');
    setState(() {
      CountriesDAta = json.decode(response.body);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    featchWorldWideData();
    featchCountriesData();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            imgHeader(context),
           Padding(
             padding: const EdgeInsets.only(top: 15, bottom: 5),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: <Widget>[
                 Container(
                   margin: EdgeInsets.only(left: 10),
                   height: 35,
                   decoration: BoxDecoration(
                       color: Colors.teal,
                       borderRadius: BorderRadius.all(Radius.circular(25.0))),
                   width: width / 1.7,
                   child: Center(
                     child: Text(
                       'World Wide',
                       style: TextStyle(
                           color: Colors.black,
                           fontWeight: FontWeight.bold,
                           fontSize: 18),
                     ),
                   ),
                 ),
                 SizedBox(
                   width: 10,
                 ),
                 Container(
                   margin: EdgeInsets.only(right: 5),
                   height: 35,
                   decoration: BoxDecoration(
                       color: Colors.blue.withOpacity(.7),
                       borderRadius: BorderRadius.all(Radius.circular(10.0))),
                   width: 100,
                   child: Center(
                     child: Text(
                       'Regional',
                       style: TextStyle(
                           color: Colors.white,
                           fontWeight: FontWeight.w600,
                           fontSize: 16),
                     ),
                   ),
                 ),
               ],
             ),
           ),
           worldDAta == null
               ? Loading(height: 220)
               : WorldWidePanel(
             MyMap: worldDAta,
           ),
           Padding(
             padding: const EdgeInsets.only(top: 15),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: <Widget>[
                 Container(
                   margin: EdgeInsets.only(left: 10),
                   height: 35,
                   decoration: BoxDecoration(
                       color: Colors.teal,
                       borderRadius: BorderRadius.all(Radius.circular(25.0))),
                   width: width / 1.7,
                   child: Center(
                     child: Text(
                       'Most Effected ',
                       style: TextStyle(
                           color: Colors.black,
                           fontWeight: FontWeight.bold,
                           fontSize: 18),
                     ),
                   ),
                 ),
               ],
             ),
           ),
           CountriesDAta == null
               ? Loading(height: 350)
               : MostEffectedPanel(
             countryData: CountriesDAta,
           )

          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Container Loading({double height}) {
    return Container(
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Loading....',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            CircularProgressIndicator(),
          ],
        ));
  }
}
