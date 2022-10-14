import 'package:flutter/foundation.dart';

class SliderProvider with ChangeNotifier {
  double increment = 0.1;
  double _value = 0;
  double get value => _value;

  void setValue(double increment) {
    _value = increment;
    notifyListeners();
  }
}
