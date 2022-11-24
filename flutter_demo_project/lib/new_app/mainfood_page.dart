
import 'package:flutter/material.dart';
import 'package:flutter_demo_project/new_app/sign_In_Food.dart';
import 'package:provider/provider.dart';
import 'HomeScreen_food.dart';
import 'add_to_cart.dart';
import 'cart_provider.dart';

void main(){
  runApp( const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_)=> CartProvide(),
        child:  Builder(builder: (BuildContext context){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {
              "/" : (context) => SignIn(),
              "HomeScreen" : (context) => HomeScreen(),
              // "CartPage"  : (context) => CartPage(),
            },
          );
        }),
    );
  }
}






/*
*
*
* MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/" : (context) => SignIn(),
        "HomeScreen" : (context) => HomeScreen(),
        // "CartPage"  : (context) => CartPage(),
      },
    );*/