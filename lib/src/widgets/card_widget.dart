import 'package:flutter/material.dart';

class CardRoutine extends StatelessWidget {
  final _height = 170.0;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(90),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Container(
          height: _height,
          color: Colors.orange,
        ),
      )
    );
  }
}