import 'package:coronavirus_pro/constants.dart';
import 'package:coronavirus_pro/widgets/status_panel.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class CountryPage extends StatefulWidget {
  // ignore: non_constant_identifier_names
  final List CountriesData;

  // ignore: non_constant_identifier_names
  const CountryPage({Key key, this.CountriesData}) : super(key: key);
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    List CountriesDAta=widget.CountriesData;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: cSecColor,
        title: Text('Country'),
      ),
      body: CountriesDAta != null
          ? ListView.builder(
//        physics:NeverScrollableScrollPhysics() ,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    showMaterialModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context, scrollController) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40.0),
                              topRight: Radius.circular(40.0)),
                          color: Colors.black54,
                        ),
                        height: MediaQuery.of(context).size.height / 1.3,
                        child: Column(
                          children: <Widget>[
                            Container(
                                width: 100,
                                height: 100,
                                child: Image.network(CountriesDAta[index]
                                    ['countryInfo']['flag'])),
                            Text(
                              CountriesDAta[index]['country'],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  letterSpacing: 1.2),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                StatusPanel(
                                  title: 'today Cases',
                                  count: '${CountriesDAta[index]['todayCases']}',
                                  textColor: Colors.redAccent,
                                  panelColor: Colors.redAccent.withOpacity(.6),
                                  width:
                                      MediaQuery.of(context).size.width / 2.2,
                                ),
                                StatusPanel(
                                  title: 'cases',
                                  count: '${CountriesDAta[index]['cases']}',
                                  textColor: Colors.redAccent,
                                  panelColor: Colors.redAccent.withOpacity(.6),
                                  width:
                                      MediaQuery.of(context).size.width / 2.5,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                StatusPanel(
                                  title: 'today Deaths',
                                  count: '${CountriesDAta[index]['todayDeaths']}',
                                  textColor: Colors.grey,
                                  panelColor: Colors.grey,
                                  width:
                                  MediaQuery.of(context).size.width / 2.2,
                                ),
                                StatusPanel(
                                  title: 'deaths',
                                  count: '${CountriesDAta[index]['deaths']}',
                                  textColor: Colors.grey,
                                  panelColor: Colors.grey,
                                  width:
                                  MediaQuery.of(context).size.width / 2.5,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                StatusPanel(
                                  title: 'today Recovered',
                                  count: '${CountriesDAta[index]['todayRecovered']}',
                                  textColor: Colors.green,
                                  panelColor: Colors.green,
                                  width:
                                  MediaQuery.of(context).size.width / 2.2,
                                ),
                                StatusPanel(
                                  title: 'recovered',
                                  count: '${CountriesDAta[index]['recovered']}',
                                  textColor: Colors.greenAccent,
                                  panelColor: Colors.greenAccent,
                                  width:
                                  MediaQuery.of(context).size.width / 2.5,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                StatusPanel(
                                  title: 'active',
                                  count: '${CountriesDAta[index]['active']}',
                                  textColor: Colors.amber,
                                  panelColor: Colors.amber,
                                  width:
                                  MediaQuery.of(context).size.width / 2.2,
                                ),

                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.all(5),
                    height: 50,
                    decoration: BoxDecoration(
                        color: cSecColor,
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                            width: 50,
                            height: 50,
                            child: Image.network(
                                CountriesDAta[index]['countryInfo']['flag'])),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: width / 4.5,
                          child: Text(
                            CountriesDAta[index]['country'],
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: width / 4,
                          child: Text(
                            'Cases: ${CountriesDAta[index]['cases']}',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: width / 4 - 5,
                          child: Text(
                            'Deaths: ${CountriesDAta[index]['deaths']}',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: CountriesDAta == null ? 0 : CountriesDAta.length,
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
