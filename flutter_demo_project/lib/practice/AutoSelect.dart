import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MaterialApp(
    home: SelectList(),
  ));
}

class SelectList extends StatefulWidget {
  const SelectList({Key? key}) : super(key: key);

  @override
  State<SelectList> createState() => _SelectListState();
}

class _SelectListState extends State<SelectList> {

  final _nameController = new TextEditingController();

  List<String> nameList = [
    "Soma",
    "Sholanki",
    "Surovita",
    "Sanu",
    "Sourav",
    "Payel",
    "Pavani",
    "Priyanka",
    "Jayanta",
    "Puspita",
    "Raju",
    "Asghar",
    "Gonu",
  ];

  GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("AutoSelect List"),),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children:  [
            AutoCompleteTextField(
              key: key,
              controller: _nameController,
              suggestions: nameList ,
              style: const TextStyle(
                color: Colors.black,
              ),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )
              ),
              itemFilter: (item, query){
                return item.toString().toLowerCase().startsWith(query.toLowerCase());
              },
              itemSorter:(a ,b){
                return a.toString().compareTo(b.toString());
              },
              itemSubmitted: (item){
                _nameController.text = item.toString();
              },
              itemBuilder: (context , item){
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Text(
                        item.toString(),
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                );
              },

            )
          ],
        ),
      ),

    );
  }
}