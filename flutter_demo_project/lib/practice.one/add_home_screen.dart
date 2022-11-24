import 'package:flutter/material.dart';
import 'package:flutter_demo_project/practice.one/product_list_screen.dart';

void main(){
  runApp(const MainAddToCartPage());
}

class MainAddToCartPage extends StatelessWidget {
  const MainAddToCartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/" : (context) => const ProductListScreen(),
      },
    );
  }
}
