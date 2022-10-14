import 'package:flutter/cupertino.dart';

class CountProvider with ChangeNotifier {
  int _count = 0;

  // One liner getter function
  int get count => _count;

  void setCount() {
    _count++;
    // it will reset the state
    notifyListeners();
  }
}
