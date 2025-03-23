import 'package:flutter/widgets.dart';

class MySwitchingController with ChangeNotifier implements Listenable {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void onSelect(int index){
    _selectedIndex = index;
    notifyListeners();
  }

}