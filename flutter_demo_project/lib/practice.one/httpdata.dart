import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: "Http data Fetch",
    home: DataFetch(),
  ));
}

class DataFetch extends StatefulWidget {
  const DataFetch({Key? key}) : super(key: key);

  @override
  State<DataFetch> createState() => _DataFetchState();
}

class _DataFetchState extends State<DataFetch> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text(
          "https Data Fetch",
          style: TextStyle(color: Colors.black, fontSize: 25, wordSpacing: 2),
        ),
      ),
body: Container(
child: Image.asset("name"),
),
    );
  }
}
