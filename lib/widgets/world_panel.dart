import 'package:coronavirus_pro/widgets/status_panel.dart';
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

