import 'package:coronavirus_pro/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WorldWidePanel extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final Map MyMap;

  // ignore: non_constant_identifier_names
  const WorldWidePanel({Key key, this.MyMap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            height: 110,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                StatusPanel(
                  title: 'Today Cases',
                  count: '${MyMap['todayCases']}',
                  panelColor: Colors.purple,
                  textColor: Colors.black,
                ),
                StatusPanel(
                  title: 'today Deaths',
                  count: '${MyMap['todayDeaths']}',
                  panelColor: Colors.grey,
                  textColor: Colors.black,
                ),
                StatusPanel(
                  title: 'today Recovered',
                  count: '${MyMap['todayRecovered']}',
                  panelColor: Colors.green.withOpacity(.8),
                  textColor: Colors.black,
                ),
              ],
            )),
        Container(
            height: 110,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                StatusPanel(
                  title: 'Total cases',
                  count: '${MyMap['cases']}',
                  panelColor: Colors.redAccent,
                  textColor: Colors.redAccent,
                ),
                StatusPanel(
                  title: 'Total ACTIVE',
                  count: '${MyMap['active']}',
                  panelColor: Colors.amber.withOpacity(.7),
                  textColor: Colors.amber,
                ),
                StatusPanel(
                  title: 'Total Recovered',
                  count: '${MyMap['recovered']}',
                  panelColor: Colors.green,
                  textColor: Colors.green,
                ),
                StatusPanel(
                  title: 'Total DEATHS',
                  count: '${MyMap['deaths']}',
                  panelColor: Colors.grey,
                  textColor: Colors.grey,
                ),
              ],
            ))
      ],
    );
  }
}

class StatusPanel extends StatelessWidget {
  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  const StatusPanel(
      {Key key, this.panelColor, this.textColor, this.title, this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
      width: width / 2.1,
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
