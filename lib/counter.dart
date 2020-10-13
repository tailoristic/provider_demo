import 'package:flutter/cupertino.dart';

class Counter extends ChangeNotifier {
  int _counter = 60;
  int getCounter() => _counter;
  updateCounter() {
    _counter--;
    notifyListeners();
  }
}
