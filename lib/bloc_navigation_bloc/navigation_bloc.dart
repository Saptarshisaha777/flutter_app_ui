import 'package:bloc/bloc.dart';
import 'package:flutter_app/models/Ids.dart';
import 'package:flutter_app/models/model.dart';
import 'package:flutter_app/pages/Homepage.dart';
import 'package:flutter_app/pages/Payments.dart';
import '../pages/MyLinks.dart';
enum NavigationEvents {
  HomePageClickedEvent,
  MyLinkClickedEvent,
  PaymentsEvent,
}


abstract  class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents,NavigationStates> {

  NavigationBloc(NavigationStates initialState) : super(initialState){
    initialState = Homepage();
  }    //SOLVED THE ZERO CONSTRUCTOR ERROR OF Bloc SuperClass


  @override
  // TODO: implement initialState
  //NavigationStates get initialState => Homepage();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    // TODO: implement mapEventToState
    print(currentUser.name);
    switch(event) {
      case NavigationEvents.HomePageClickedEvent: yield Homepage();
        break;
      case NavigationEvents.MyLinkClickedEvent : yield MyLinks(user: currentUser);
      break;
      case NavigationEvents.PaymentsEvent : yield Payments();
      break;
    }
    throw UnimplementedError();
  }

}
