import 'package:flutter/material.dart';
import 'package:flutter_demo_project/second_route.dart';

void main() {
  runApp(const MaterialApp(
    home: Practice(),
  ));
}

class Practice extends StatefulWidget {
  const Practice({Key? key}) : super(key: key);

  @override
  State<Practice> createState() => _PracticeState();
}

class _PracticeState extends State<Practice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Practice"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("data"),
                        actions: [
                          TextButton(onPressed: ()=>Navigator.pop(context), child: const Text("back")),
                          TextButton(onPressed: ()=>Navigator.push(context,MaterialPageRoute(builder: (_)=> SecondRoute())), child:const Text("SecondRoute")),
                          TextButton(onPressed: ()=>Navigator.push(context,MaterialPageRoute(builder: (_)=> Practice())), child:const Text("Practice")),
                        ],
                      );
                    },
                  );
                },
                child: const Text("Alertbutton")),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  SecondRoute()),
                );
              },
              child: Image.network(
                "https://image.shutterstock.com/image-vector/hands-holding-photo-camera-shutter-260nw-679476358.jpg",
                width: 200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
