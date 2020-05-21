import 'package:flutter/material.dart';
import 'package:powersaucef/src/widgets/card_routine_widget.dart';


class HomePage extends StatelessWidget {
  final _appBarTitleStyle = TextStyle(fontSize: 14.0, );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      body: _getContent(),
      );
  }


  Widget _getAppBar() {
    return AppBar(
        title: Text('POWERSAUCEF', style: _appBarTitleStyle,),
        backgroundColor: Colors.black54,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {
            print('Settings open!!!!');
          },
          ),
        
        actions: <Widget>[
          IconButton(icon: Icon(Icons.notifications), onPressed: (){
            print('notifications open!!!!');
          })
        ],
      );
  }

  Widget _getContent(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _title('Rutina Personalizada'),
        _getRoutine(),
      ],
    );
  }

  Widget _title(String text){
    const titleStyle = TextStyle(fontSize: 24, fontWeight: FontWeight.bold,);
    return Container(child: Text(text, style: titleStyle,), padding: EdgeInsets.all(20.0),);
  }

  Widget _getRoutine() {
    return Center(child: CardRoutine());
  }
}

