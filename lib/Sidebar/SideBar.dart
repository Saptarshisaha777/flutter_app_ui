import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/Sidebar/menu_item.dart';
import 'package:flutter_app/bloc_navigation_bloc/navigation_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}


class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin<SideBar> {
  AnimationController _animationController;
  StreamController<bool> isSidebarOpenedStreamController;
  Stream<bool> isSidebarOpenedStream;
  StreamSink<bool> isSidebarOpenedSink;
  final _animationduration  = const Duration(milliseconds: 500);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(vsync: this,duration: _animationduration);
    isSidebarOpenedStreamController = PublishSubject<bool>();
    isSidebarOpenedStream = isSidebarOpenedStreamController.stream;
    isSidebarOpenedSink = isSidebarOpenedStreamController.sink;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    isSidebarOpenedStreamController.close();
    isSidebarOpenedSink.close();
    super.dispose();
  }

  void onIconPressed(){
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if (isAnimationCompleted){
      isSidebarOpenedSink.add(false);
      _animationController.reverse();
    } else {
      isSidebarOpenedSink.add(true);
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;

    return StreamBuilder<bool>(
      initialData: false,
      stream: isSidebarOpenedStream,
      builder: (context , isSidebarOpenedAsync){
        return AnimatedPositioned(
          duration: _animationduration,
          top: 0,
          bottom: 0,
          left: isSidebarOpenedAsync.data ? 0: -screenwidth,
          right: isSidebarOpenedAsync.data ? 0 : screenwidth - 35,
          child: Row(
            children: <Widget>[
              Expanded(
                child:Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  color: Colors.grey[850],//Color(0xFF262AAA),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 100,
                      ),
                      ListTile(
                        title: Text(
                          'USER',
                          style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w800),
                        ),
                        subtitle: Text(
                          "Userid",
                          style: TextStyle(color: Colors.blueAccent,fontSize: 20),
                        ),
                        leading: CircleAvatar(
                          child: Icon(
                            Icons.perm_identity,
                            color: Colors.white,
                          ),
                          radius: 40,
                        ),
                      ),
                      Divider(
                        height: 64,
                        thickness: 1,
                        color: Colors.blueAccent.withOpacity(.5),
                        indent: 16,
                        endIndent: 16,
                      ),
                      Menuitem(
                        icon: Icons.home,
                        title: "Home",
                        onTap: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.HomePageClickedEvent);
                        },
                      ),
                      Menuitem(
                        icon: Icons.person,
                        title: "My Account",

                      ),
                      Menuitem(
                        icon: Icons.payment,
                        title: "Payment",
                        onTap: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.PaymentsEvent);
                        },
                      ),
                      Menuitem(
                        icon: Icons.people,
                        title: "Links",
                        onTap: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyLinkClickedEvent);
                        },
                      ),
                      Divider(
                        height: 64,
                        thickness: 1,
                        color: Colors.blueAccent.withOpacity(.5),
                        indent: 16,
                        endIndent: 16,
                      ),
                      Menuitem(
                        icon: Icons.settings,
                        title: "Settings",
                      ),Menuitem(
                        icon: Icons.exit_to_app,
                        title: "Logout",
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0,-0.9),
                child: GestureDetector(
                  onTap: () {
                    onIconPressed();
                  },
                  child: ClipPath(
                    clipper: CustomMenuClipper(),
                    child: Container(
                      width: 35,
                      height: 110,
                      color: Colors.grey[850],//Color(0xFF262AAA),
                      alignment: Alignment.centerLeft,
                      child: AnimatedIcon(
                        icon: AnimatedIcons.menu_close,
                        progress: _animationController.view,
                        color: Colors.white,//Color(0xFF188FFD),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Paint paint = Paint();
    paint.color = Colors.white;
    final width = size.width;
    final height  = size.height;
    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width-1, height/2 - 20, width, height/2);
    //path.close();
    path.quadraticBezierTo(width+1, height/2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    path.close();
    return path;

  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }

}
