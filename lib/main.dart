import 'package:flutter/material.dart';
import 'package:powersaucef/src/pages/home_page.dart';
import 'package:powersaucef/src/pages/routine_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home'            :    (BuildContext context) => HomePage(),
        'routine'         :    (BuildContext context) => RoutinePage(),
      },
      
    );
  }
}