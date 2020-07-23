import 'package:flutter_app/models/model.dart';
import 'package:flutter_app/bloc_navigation_bloc/navigation_bloc.dart';
import 'package:flutter_app/pages/MyLinks.dart';


final User currentUser = User(
  id:0,
  name: 'me',
  links: [1,2],
  //imageUrl: ,
);
//final User Ram = User(
//  id:2,
//  name: 'Ram',
//  links: [Raju],
//  //imageUrl: ,
//  parent: currentUser,
//);
//final User Shyam = User(
//  id:3,
//  name: 'Shyam',
//  links: [Babubhaiya],
//  //imageUrl: ,
//  parent: currentUser,
//);
//final User Raju = User(
//  id:4,
//  name: 'Raju',
//  //links: [],
//  //imageUrl: ,
//  parent: Ram,
//);
//final User Babubhaiya = User(
//  id:5,
//  name: 'Babubhaiya',
//  //links: [],
//  //imageUrl: ,
//  parent: Shyam,
//);

final User Ram = User(
  id:1,
  name: 'Ram',
  links: [3],
  //imageUrl: ,
  parent: 0,
);
final User Shyam = User(
  id:2,
  name: 'Shyam',
  links: [4],
  //imageUrl: ,
  parent: 0,
);



final User Raju = User(
  id:3,
  name: 'Raju',
  links: [],
  //imageUrl: ,
  parent: 1,
);

final User Babubhaiya = User(
  id:4,
  name: 'Babubhaiya',
  links: [],
  //imageUrl: ,
  parent: 2,
);

final List<User> net = [currentUser,Ram,Shyam,Raju,Babubhaiya] ;