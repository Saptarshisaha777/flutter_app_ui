import 'package:flutter/material.dart';
import 'package:flutter_app/models/model.dart';

class Userview extends StatelessWidget {
  final User main_user;

  const Userview({Key key, this.main_user}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    //var us = main_user?.name ?? 'No name';
    return Container(
      height: 200,
      color: Colors.white70,
      child: Column(
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              child: CircleAvatar(
                child: Icon(
                  Icons.perm_identity,
                  color: Colors.white,
                ),
                radius: 70,
              ),
            ),
          ),
          Center(
            child: Text(
              main_user.name,
              //us,
              //'no name',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }
}
