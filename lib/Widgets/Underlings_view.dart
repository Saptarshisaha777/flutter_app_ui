import 'package:flutter/material.dart';
import 'package:flutter_app/pages/MyLinks.dart';
import 'package:flutter_app/models/Ids.dart';
class Underlings extends StatelessWidget {
  const Underlings({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final MyLinks widget;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),

          ),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical : 25.0),
              child: Container(
                height: 150,
                color: Theme.of(context).accentColor,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.user.links?.length ?? 1,
                    itemBuilder: (BuildContext context,int index){
                      String nam = net[widget?.user?.links[index] ?? 0].name ?? 'noone';
                      return GestureDetector(
                        onTap:  () {
                          print(net[widget.user.links[index]].name);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyLinks(user: net[widget.user.links[index]],
                                )),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric( horizontal : 10.0),
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
                                //index.toString(),
                                nam,
                              ),
                            ],
                          ),
                        ),
                      );

                    }),
              ),
            ),
          ],
        ), // The Custom links
      ),

    );
  }
}