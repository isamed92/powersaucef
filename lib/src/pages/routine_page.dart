import 'package:flutter/material.dart';
import 'package:powersaucef/src/models/routine_model.dart';
import 'package:powersaucef/src/widgets/activity_row_widget.dart';

class RoutinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Routine rutina = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _createAppBar(rutina),
          SliverList(
            delegate: SliverChildListDelegate([
              // SizedBox(height: 10.0),
              _createDataRoutine(rutina),
              Column(
                children: _createPath(rutina),
                ),
            ]),
          )
        ],
      ),
    );
  }

  Widget _createAppBar(Routine routine) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.black87,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          routine.name,
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        background: Image(
          image: AssetImage(routine.bgImg),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _createDataRoutine(Routine routine) {
    return Container(
      color: Colors.black87,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _mostrarData(Icons.watch_later, 'Duración', routine.duration),
          _mostrarData(Icons.fitness_center, 'Ejercicios', '0'+ routine.excersices.length.toString()),
          _mostrarData(Icons.filter_tilt_shift, 'Intensidad', routine.level),
        ],
      ),
    );
  }

  Widget _mostrarData(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            size: 25.0,
            color: Colors.deepPurple,
          ),
          SizedBox(width: 15.0,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                value,
                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ],
          )
        ],
      ),
    );
  }

  List<Widget> _createPath(Routine routine) {
    return routine.excersices.map((exercise) {
      return ActivityRow(
        exercise: exercise,
      );
    }).toList();
  }
}
