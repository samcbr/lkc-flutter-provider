import 'package:flutter/widgets.dart';

//This is a provider used for implementing routing in the application by using provider pattern
class RoutesService with ChangeNotifier {
  Widget _route;
  Widget get route => _route;
  void setRoute(Widget route) {
    this._route = route; //replaces the current widget being shown on the screen
    notifyListeners();
  }
}
