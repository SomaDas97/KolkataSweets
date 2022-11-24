import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo_project/new_app/database_helper.dart';
import 'package:flutter_demo_project/new_app/sweets_listclass.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvide with ChangeNotifier{
  DataBaseHelper db = DataBaseHelper();

  int _counter = 0;
  int get counter => _counter;

  double _totalprice = 0;
  double get totalprice => _totalprice;

  late List<SweetList> _cart;
  List<SweetList> get cart => _cart;

  Future<List<SweetList>> getData () async{
    _cart = await db.getCartList();
   // _counter = _cart.length;
    notifyListeners();
    return _cart;
  }

  void _setPrefItems()async{
    SharedPreferences prefs =await  SharedPreferences.getInstance();
    prefs.setInt('count',_counter);
    prefs.setDouble('price',_totalprice);
    notifyListeners();
  }

  void _getPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counter = prefs.getInt('count') ?? 0;
    _totalprice = (prefs.getDouble('price')?? 0.0);
    notifyListeners();
  }

  void addTotalPrice(double price){
    _totalprice = (_totalprice + price);
    _setPrefItems();
    notifyListeners();
  }

  void removeTotalPrice(double price){
    _totalprice = (_totalprice - price);
    _setPrefItems();
    notifyListeners();
  }
   getTotalPrice(){
     _totalprice;
    _getPrefItems();
    return  _totalprice ;
  }
  void addCounter(){
    _counter++ ;
    _setPrefItems();
    notifyListeners();
  }

  void removeCounter(){
    _counter-- ;
    _setPrefItems();

    notifyListeners();
  }
  int getCounter(){
    //_counter;
    _getPrefItems();
    print(_counter);
    return  _counter ;
  }
  //===================
  void deleteItem(int index) async{
    await db.delete(cart[index].id!);
    removeCounter();
    await getData();
    notifyListeners();
  }// cartprovider
//===============


  List<SweetList>? itemlistview = [];
  Future<List<SweetList>?> loadData() async {
    await Future.delayed(const Duration(seconds: 1));
    var catLogJson =
    await rootBundle.loadString("asset/new_app/jsonsweet.json");
    var decodeData = jsonDecode(catLogJson) as List;

      itemlistview?.clear();
      itemlistview?.addAll(
          List<SweetList>.from(decodeData.map((e) => SweetList.fromMap(e))));

    return itemlistview;
  }



}