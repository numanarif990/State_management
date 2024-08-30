import 'package:flutter/foundation.dart';
class MultiProvider1 with ChangeNotifier{
  double _value = 1.0;
  double get value => _value;
  void setValue (double val){
    _value = val;
    notifyListeners();
  }
}