import 'package:flutter/material.dart';


void main(){
  runApp(const MaterialApp(
    home: AutoListTwo(),
  ));
}

class AutoListTwo extends StatefulWidget {
  const AutoListTwo({Key? key}) : super(key: key);

  @override
  State<AutoListTwo> createState() => _AutoListTwoState();
}

class _AutoListTwoState extends State<AutoListTwo> {

  List<String> suggestion = [
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Auto List "),),
        body: Column(
            children: [
              Autocomplete(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text == '') {
                    return const Iterable<String>.empty();
                  }else{
                    List<String> matches = <String>[];
                    matches.addAll(suggestion);

                    matches.retainWhere((s){
                      return s.toLowerCase().contains(textEditingValue.text.toLowerCase());
                    });
                    return matches;
                  }
                },
                // onSelected: (String selection) {
                //   print('You just selected $selection');
                // },
              ),
            ]
        )
      // RawAutocomplete(
      //   optionsBuilder: (TextEditingValue textEditingValue) {
      //     if (textEditingValue.text == '') {
      //       return const Iterable<String>.empty();
      //     }else{
      //       List<String> matches = <String>[];
      //       matches.addAll(suggestion);
      //
      //       matches.retainWhere((s){
      //         return s.toLowerCase().contains(textEditingValue.text.toLowerCase());
      //       });
      //       return matches;
      //     }
      //   },
      //
      //   onSelected: (String selection) {
      //     print('You just selected $selection');
      //   },
      //
      //   fieldViewBuilder: (BuildContext context, TextEditingController textEditingController,
      //       FocusNode focusNode,
      //       VoidCallback onFieldSubmitted) {
      //     return Padding(
      //       padding: const EdgeInsets.all(20.0),
      //       child: TextField(
      //         decoration: const InputDecoration(
      //             border: OutlineInputBorder()
      //         ),
      //         controller: textEditingController,
      //         focusNode: focusNode,
      //         onSubmitted: (String value) {
      //
      //         },
      //       ),
      //     );
      //   },
      //
      //   optionsViewBuilder: (BuildContext context, void Function(String) onSelected,
      //       Iterable<String> options) {
      //     return Material(
      //         child:SizedBox(
      //             height: 200,
      //             child:SingleChildScrollView(
      //                 child: Column(
      //                   children: options.map((opt){
      //                     return InkWell(
      //                         onTap: (){
      //                           onSelected(opt);
      //                         },
      //                         child:Container(
      //                             padding: const EdgeInsets.only(right:20, left: 20),
      //                             child:Card(
      //                                 child: Container(
      //                                   width: double.infinity,
      //                                   padding: const EdgeInsets.all(10),
      //                                   child:Text(opt),
      //                                 )
      //                             )
      //                         )
      //                     );
      //                   }).toList(),
      //                 )
      //             )
      //         )
      //     );
      //   },
      // )

    );
  }
}
