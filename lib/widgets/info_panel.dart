import 'package:flutter/material.dart';
class InfoPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
//              imgHeader(context),
              Text('Info')
            ],
          ),
        ),
      ),
    );
  }
}
