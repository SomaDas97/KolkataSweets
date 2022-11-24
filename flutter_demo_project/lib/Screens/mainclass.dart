
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/counterclass.dart';
import 'homeclass.dart';

void main(){
  runApp(
ChangeNotifierProvider<Counterclass>(create: (_)=> Counterclass(),
child: const MyApp(),));
      //const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',

      routes: {
        '/' : (context) =>  const HomePage(),
      },
    );
  }
}
