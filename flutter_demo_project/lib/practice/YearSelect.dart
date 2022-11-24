import 'package:flutter/material.dart';

void main(){
  runApp(const MaterialApp(
    home: YearSelected(),
  ));
}
class YearSelected extends StatelessWidget {
  const YearSelected({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text("hii"),
          onPressed: (){
            showDialog(
              context: context,
              builder: (context) {
                final Size size = MediaQuery.of(context).size;
                return AlertDialog(
                  title: const Text('Select a Year'),

                  contentPadding: const EdgeInsets.all(10),
                  content: SizedBox(
                    height: size.height / 3,
                    width: size.width,

                    child: GridView.count(
                      crossAxisCount: 3,
                      children: [
                        ...List.generate(
                          10,
                              (index) => InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Chip(
                                label: Container(
                                  padding: const EdgeInsets.all(5),
                                  child: Text(
                                    (DateTime.now().year - index).toString(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}