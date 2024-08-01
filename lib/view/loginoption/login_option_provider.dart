// login_method_provider.dart
import 'package:flutter/foundation.dart';

class LoginMethodProvider with ChangeNotifier {
  String _loginMethod = "";

  String get loginMethod => _loginMethod;

  void setLoginMethod(String method) {
    _loginMethod = method;
    notifyListeners();
  }
}
