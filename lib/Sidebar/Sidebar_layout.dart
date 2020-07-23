import 'package:flutter/material.dart';
import 'package:flutter_app/bloc_navigation_bloc/navigation_bloc.dart';
import 'package:flutter_app/pages/Homepage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'SideBar.dart';

class Sidebar_layout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<NavigationBloc>(
        create: (context) => NavigationBloc(Homepage()), //CREATED A CONSTRUCTOR IN NAVIGATION_BLOC
        child: Stack(
          children: <Widget>[
            BlocBuilder<NavigationBloc,NavigationStates>(
            builder : (context,navigationState) {
              return navigationState as Widget;
              },
            ),
            // Homepage(),
            SideBar(),
          ],
        ),
      ),
    );
  }
}
