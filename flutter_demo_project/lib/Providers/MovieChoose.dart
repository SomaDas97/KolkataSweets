import 'package:flutter/material.dart';

class MovieChoose extends ChangeNotifier {
  List favList = [];
int ci=1;
  get fav => null;
  void changeval(val){
    ci=val;
    notifyListeners();
  }

  addtoList(index) {

    favList.add(index);
    notifyListeners();
  }

  removeList(index) {
    favList.remove(index);
    notifyListeners();
  }
}
