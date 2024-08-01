import 'package:flutter/cupertino.dart';

class ListIndexProvider with ChangeNotifier {
  int selectedIndex = -1;

  void setSelectedIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
