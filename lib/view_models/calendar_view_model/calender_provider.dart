import 'package:flutter/material.dart';

class CalendarProvider extends ChangeNotifier {
  DateTime selectedDate = DateTime.now();

  // DateTime get selectedDate => _selectedDate;

  void selectDateFunc(DateTime date) {
    selectedDate = date;
    notifyListeners(); // Notify all listening widgets to rebuild
  }
}
