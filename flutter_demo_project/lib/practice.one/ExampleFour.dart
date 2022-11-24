
import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(
    title: "My Profile",
    home: MainPage(),
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
  ));
}
class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}
class _MainPageState extends State<MainPage> {
  TextEditingController _nameController = TextEditingController();
  var myText = "Make Today Magical";
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text("My Profile"),
        ),
        body:Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
            child: Card(
            child: Column(
            children: [
            Image.asset("asset/background.png"),
        SizedBox(
          height: 20,
        ),
        Text(
          myText,
          style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
        padding: const EdgeInsets.all(16.0),
    child: TextField(
    controller: _nameController,
    decoration: InputDecoration(
    border: OutlineInputBorder(),
    hintText: "Enter Something here", labelText:"Write Something",
    ),
    ),
        )
            ],
            ),
            ),
            ),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            myText = _nameController.text;
          });
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}