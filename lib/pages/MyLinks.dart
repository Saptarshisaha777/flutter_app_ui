import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Widgets/User_view.dart';
import 'package:flutter_app/Widgets/Underlings_view.dart';
import 'package:flutter_app/bloc_navigation_bloc/navigation_bloc.dart';
import 'package:flutter_app/models/Ids.dart';
import 'package:flutter_app/models/model.dart';



class MyLinks extends StatefulWidget with NavigationStates {
  final User user;

  const MyLinks({Key key, this.user}) : super(key: key);

  @override
  _MyLinksState createState() => _MyLinksState();
}
class _MyLinksState extends State<MyLinks> {
  @override

  Widget build(BuildContext context) {
    print(widget.user.id);
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        elevation: 0,
        leading: SizedBox(width: 20,),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.blueGrey,),
            iconSize: 30,
            onPressed: () {
              if (widget.user == currentUser){
             }
              else{
                Navigator.pop(
                  context,
                );
              }

            },
          )
        ],
        backgroundColor: Colors.white70,
        title: Center(
          child: Text(
               //widget.user.name,
               'The Network',
               style: TextStyle(
                 fontSize: 30,
                 color: Colors.blue,
          ),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Userview(main_user: widget.user,),
          Underlings(widget: widget),

        ],
      )
    );
  }
}

