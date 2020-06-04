import 'package:flutter/material.dart';
import 'package:powersaucef/src/widgets/card_routine_widget.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatelessWidget {
  final _appBarTitleStyle = TextStyle(fontSize: 14.0, );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      body: Center(child: _getFirebaseData()),
      // body: _getContent(),
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

  Widget _getFirebaseData(){
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('users').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError)
          return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting: return new Text('Cargando...');
          default:
            return new ListView(
              padding: EdgeInsets.all(20.0),
              children: snapshot.data.documents.map((DocumentSnapshot document) {
                return Row(

                  children: <Widget>[
                    Text(document['fullname'], style: TextStyle(fontSize: 25.0)),
                    SizedBox(width: 50.0,),
                    Text(document['email'],),
                    SizedBox(width: 50.0,),
                    Text(document['status'].toString(), style: TextStyle(color: _getColor(document['status']),fontSize: 20.0))
                  ] 

                );
              }).toList(),
            );
        }
      },
    );
  }

  Color _getColor(bool status){
    
    return (status ? Colors.green : Colors.red);

  }

}

