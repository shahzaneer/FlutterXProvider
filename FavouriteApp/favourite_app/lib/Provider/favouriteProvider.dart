import 'package:flutter/foundation.dart';

class FavouriteProvider with ChangeNotifier {
  final List<int> _items = [];

  List<int> get items => _items;

  int getSize(){
    return _items.length;
  }
  // add in the list

  void addItem(int val) {
    _items.add(val);

    notifyListeners();
  }

// Remove in the list

  void removeItems(int val) {
    _items.remove(val);

    notifyListeners();
  }
}
