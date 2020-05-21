

import 'package:powersaucef/src/models/activity_model.dart';

class Routine {
  String name;
  String tag;
  String level;
  int difficulty;
  String duration;
  String bgImg;
  List<Activity> excersices;

  Routine({
    this.name,
    this.tag,
    this.level,
    this.difficulty,
    this.duration,
    this.bgImg,
    this.excersices
  });

}