import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'namkeen_listclass.dart';

class NamkeenScreen extends StatefulWidget {
  const NamkeenScreen({Key? key}) : super(key: key);

  @override
  State<NamkeenScreen> createState() => _NamkeenScreenState();
}

class _NamkeenScreenState extends State<NamkeenScreen> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  List<NamkeenList>? itemlistview = [];

  Future<List<NamkeenList>?> loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    var catLogJson = await rootBundle.loadString(
        "asset/new_app/jsonNamkeen.json");
    var decodeData = jsonDecode(catLogJson) as List;

    setState(() {
      itemlistview?.clear();
      itemlistview?.addAll(List<NamkeenList>.from(
          decodeData.map((e) => NamkeenList.fromMap(e))));
    });
    return itemlistview;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
              itemCount: itemlistview?.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage("${itemlistview?[index].image}"),
                          ),
                          borderRadius: BorderRadius.circular(20)
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          width: 100,
                          child: Text(
                            "${itemlistview?[index].name}", style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(
                                Icons.add, color: Colors.white, size: 16,),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0),
                              child: Text("1", style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),),
                            ),
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Icon(
                                Icons.add, color: Colors.white, size: 16,),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                );
              })
        ],
      ),
    );
  }
}
