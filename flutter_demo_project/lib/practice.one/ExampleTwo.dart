import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(
    title: "Awesome App",
    home: HomePage(),
  ));
}
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Awesome App"),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(8),
          width: 100,
          height: 100,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.brown,
                  blurRadius: 5,
                  offset: Offset(2.0 , 5.0)
              ),
            ],
            gradient: LinearGradient(
              colors: [Colors.yellow, Colors.pink],
            ),
          ),
          child: Text(
            "I am a Box",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}