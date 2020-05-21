import 'package:flutter/material.dart';
import 'package:powersaucef/src/models/activity_model.dart';

class ActivityRow extends StatelessWidget {
  final Activity exercise;

  ActivityRow({this.exercise});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        _getImg(),
        _getRepeat(),
        SizedBox(width: 15.0,),
        _getName(),
      ],
    );
  }

  Widget _getImg() {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          width: 80.0,
          height: 80.0,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _getName(){
    return Container(
      child: Text(exercise.name,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
    );
  }
  Widget _getRepeat(){
    return Container(
      child: Text(exercise.repeat, style: TextStyle(fontSize: 20.0, color: Colors.grey, fontWeight: FontWeight.bold),),
    );
  }
}
