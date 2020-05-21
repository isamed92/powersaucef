import 'package:flutter/material.dart';
import 'package:powersaucef/src/models/ROUTINES_DATA.dart';
import 'package:powersaucef/src/models/routine_model.dart';

class CardRoutine extends StatelessWidget {
  final List<Routine> rutinas = RUTINAS().getRutinas();

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          child: _info(),
          height: _screenSize.height * .30,
          width: _screenSize.width * .85,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(rutinas[2].bgImg), fit: BoxFit.cover)),
        ),
      ),
      onTap: (){
        Navigator.pushNamed(context, 'routine', arguments: rutinas[2]);
      },
    );
  }

  Widget _info() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          child: _tag(rutinas[2].tag),
          padding: EdgeInsets.only(left: 15.0, top: 15.0),
        ),
        Expanded(child: Container()),
        _name(rutinas[2].name),
        Row(
          children: <Widget>[
            _level(rutinas[2].level, rutinas[2].difficulty),
            Expanded(
              child: Container(),
            ),
            _duration(rutinas[2].duration),
          ],
        )
      ],
    );
  }

  Widget _tag(String type) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5.0),
      child: Container(
        padding: EdgeInsets.all(10.0),
        color: Color.fromRGBO(189, 193, 204, 0.5),
        child: Text(
          type,
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
    );
  }

  Widget _name(String name) {
    return Container(
      padding: EdgeInsets.only(left: 20.0, bottom: 5.0),
      child: Text(
        name,
        style: TextStyle(
            color: Colors.white, fontSize: 34, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _level(String level, int difficulty) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            level,
            style: TextStyle(color: Colors.white, fontSize: 12.0),
          ),
          SizedBox(
            width: 5.0,
          ),
          _generateIcons(difficulty),
        ],
      ),
    );
  }

  Widget _generateIcons(int difficulty) {
    var icons;
    switch (difficulty) {
      case 1:
        icons = Row(
          children: <Widget>[
            Icon(Icons.arrow_upward, color: Colors.green, size: 12.0),
            Icon(Icons.arrow_upward, color: Colors.grey, size: 12.0),
            Icon(Icons.arrow_upward, color: Colors.grey, size: 12.0),
          ],
        );
        break;
      case 2:
        icons = Row(
          children: <Widget>[
            Icon(
              Icons.arrow_upward,
              color: Colors.yellow,
              size: 12.0,
            ),
            Icon(
              Icons.arrow_upward,
              color: Colors.yellow,
              size: 12.0,
            ),
            Icon(
              Icons.arrow_upward,
              color: Colors.grey,
              size: 12.0,
            ),
          ],
        );
        break;
      case 3:
        icons = Row(
          children: <Widget>[
            Icon(
              Icons.arrow_upward,
              color: Colors.red,
              size: 12.0,
            ),
            Icon(
              Icons.arrow_upward,
              color: Colors.red,
              size: 12.0,
            ),
            Icon(
              Icons.arrow_upward,
              color: Colors.red,
              size: 12.0,
            ),
          ],
        );
        break;
    }
    return icons;
  }

  Widget _duration(String duration) {
    return Container(
      padding: EdgeInsets.only(right: 25),
      child: Row(children: <Widget>[
        Icon(
          Icons.av_timer,
          color: Colors.white,
          size: 16.0,
        ),
        Text(
          duration,
          style: TextStyle(color: Colors.white, fontSize: 14.0),
        ),
      ]),
    );
  }
}
