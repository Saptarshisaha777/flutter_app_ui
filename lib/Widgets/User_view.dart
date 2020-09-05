import 'package:flutter/material.dart';
import 'package:flutter_app/models/Ids.dart';
import 'package:flutter_app/models/model.dart';

class Userview extends StatelessWidget {
  final User main_user;

  const Userview({Key key, this.main_user}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var test = main_user;
    List<int> tree = [];
    print(test.parent);
    while(test.parent != null && tree.length < 5){
      print('now parent is ${test.parent}');
      tree.add(test.parent);
      test = net[test.parent];
    }
    //print('the tree is');
    print(tree);
    //var us = main_user?.name ?? 'No name';
    return Container(
      height: 300,
      color: Colors.white70,
      child: Column(
        children: <Widget>[
          Container(
            height: 110,
            color: Colors.white70,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 7),
              child: ListView.builder(
                shrinkWrap: true,
                  reverse: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: tree.length,//prime.length,
                  itemBuilder: (BuildContext context,int index){
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 7),
                      child: Column(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 35,
                            child: Icon(
                              Icons.perm_identity,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            //prime[index].name?? 'default',
                            net[tree[index]].name,
                          ),
                        ],
                      ),
                    );
              }),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              child: CircleAvatar(
                child: Icon(
                  Icons.perm_identity,
                  color: Colors.white,
                ),
                radius: 60,
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
