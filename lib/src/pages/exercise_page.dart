import 'package:flutter/material.dart';
import 'package:powersaucef/src/models/activity_model.dart';

class ExercisePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final Activity exercise = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      
      body: Center(
        child: Text(exercise.name),
      ),
    );
  }
}