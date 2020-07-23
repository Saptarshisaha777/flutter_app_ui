import 'package:flutter/material.dart';
import 'package:flutter_app/bloc_navigation_bloc/navigation_bloc.dart';
import 'package:flutter_treeview/tree_view.dart';

class Person {
  final String name;
  final List<Person> links;

  Person({this.name,this.links});
}


Person roger = Person(name: 'Roger',);
Person sam = Person(name: 'Sam',);
Person lukas = Person(name: 'Lukas',links: [sam,roger]);
final List<Node<Person>> nodes = [
  Node<Person>(
      label: '2',
      key: 'Lukas',
      data: lukas,
      children: [
        Node<Person>(key: 'Sam', label: '2',data: sam),
        Node<Person>(key: 'Roger', label: '3',data: roger),
      ]
  ),
];
TreeViewController _treeViewController = TreeViewController(children: nodes);

class Homepage extends StatelessWidget with NavigationStates {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        elevation: 0,
        title: Center(
          child: Text(
              "The Network",
               style: TextStyle(
                 fontSize: 30,
                 color: Colors.blue,
          ),
          ),
        ),
      ),
      body: Center(
        child: Container(
          child: Text('Homepage',
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
        ),
        ),
      ),
    );
  }
}
