import 'package:flutter/widgets.dart';

class RoutesService with ChangeNotifier {
  Widget _route;
  Widget get route => _route;
  void setRoute(Widget route) {
    this._route = route;
    notifyListeners();
  }
}
