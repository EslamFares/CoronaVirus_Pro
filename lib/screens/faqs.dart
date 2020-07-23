import 'package:coronavirus_pro/constants.dart';
import 'package:flutter/material.dart';

import '../data_source.dart';
class FqaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cPrimaryColor,
      appBar: AppBar(
        title: Text('FQAS'),
        backgroundColor: cSecColor,
      ),
      body: ListView.builder(
          itemCount: DataSource.questionAnswer.length,
          itemBuilder: (context,index){
        return ExpansionTile(
          backgroundColor: cSecColor,
          leading: Icon(Icons.question_answer,color: Colors.white,),
          title: Text('${DataSource.questionAnswer[index]['question']}'
            ,style: TextStyle(color: Colors.greenAccent,fontSize: 16,fontWeight: FontWeight.bold),
          ),
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15),
              child: Text('${DataSource.questionAnswer[index]['answer']}'
                ,style: TextStyle(color: Colors.white,fontSize: 16,letterSpacing: 1.2),),
            )
          ],
        );
      }),
    );
  }
}
