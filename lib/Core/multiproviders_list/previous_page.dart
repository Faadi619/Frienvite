import 'package:flutter/material.dart';

class NavigationProvider with ChangeNotifier {
  String _previousPage = '';

  String get previousPage => _previousPage;

  void setPreviousPage(String pageName) {
    _previousPage = pageName;
    notifyListeners();
  }
}
