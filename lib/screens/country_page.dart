import 'dart:convert';
import 'package:coronavirus_pro/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
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
    featchCountriesData();
  }
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: cSecColor,
        title: Text('Country'),
      ),
      body:CountriesDAta!=null? ListView.builder(
//        physics:NeverScrollableScrollPhysics() ,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              showMaterialModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context, scrollController) =>
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40.0),
                          topRight: Radius.circular(40.0)
                        ),
                        color: Colors.blueGrey[700],
                      ),
                  height: MediaQuery.of(context).size.height/1.5,
                  child: Column(children: <Widget>[
                    Container(
                        width: 100,
                        height: 100,
                        child: Image.network(
                            CountriesDAta[index]['countryInfo']['flag'])),
                    Text( CountriesDAta[index]['country'],style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      letterSpacing: 1.2
                    ),),
                    Row(children: <Widget>[

                    ],)
                  ],),
                ),
              );

            },
            child: Container(
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
                          CountriesDAta[index]['countryInfo']['flag'])),
                  SizedBox(width: 20,),
                  Container(
                    width: width / 4.5,
                    child: Text(
                      CountriesDAta[index]['country'],
                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Container(
                    width: width / 4,
                    child: Text(
                      'Cases: ${CountriesDAta[index]['cases']}',
                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Container(
                    width: width / 4-5,
                    child: Text(
                      'Deaths: ${CountriesDAta[index]['deaths']}',
                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount:CountriesDAta==null?0: CountriesDAta.length,
      ):Center(child: CircularProgressIndicator()),
    );
  }
}
