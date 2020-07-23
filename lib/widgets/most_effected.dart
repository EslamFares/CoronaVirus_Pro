
import 'package:coronavirus_pro/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MostEffectedPanel extends StatelessWidget {
  final List countryData;

  const MostEffectedPanel({Key key, this.countryData}) : super(key: key);

  @override
  Widget build(BuildContext context) {

      double width = MediaQuery.of(context).size.width;
      return Container(
        height: 350,
padding: EdgeInsets.symmetric(horizontal: 3),
        child: ListView.builder(
          physics:NeverScrollableScrollPhysics() ,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(5),
              height: 50,

              decoration: BoxDecoration(
                  color: cSecColor,
                borderRadius: BorderRadius.all(Radius.circular(10.0))
              ),
              child: Row(
                children: <Widget>[
                  SizedBox(width: 5,),
                  Container(
                      width: 50,
                      height: 50,
                      child: Image.network(
                          countryData[index]['countryInfo']['flag'])),
                  SizedBox(width: 20,),
                  Container(
                    width: width / 4.5,
                    child: Text(
                      countryData[index]['country'],
                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Container(
                    width: width / 4,
                    child: Text(
                      'Cases: ${countryData[index]['cases']}',
                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Container(
                    width: width / 4-5,
                    child: Text(
                      'Deaths: ${countryData[index]['deaths']}',
                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            );
          },
          itemCount: 5,
        ),
      );
    }
  }
