import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_demo_project/new_app/sweets_listclass.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import 'cart_provider.dart';
import 'database_helper.dart';

class SweetsScreen extends StatefulWidget {
  const SweetsScreen({Key? key}) : super(key: key);

  @override
  State<SweetsScreen> createState() => _SweetsScreenState();
}

class _SweetsScreenState extends State<SweetsScreen> {
  // int counter = 0;
  //
  // void _increment() {
  //   counter++;
  // }
  // var rating = 0.0;

  CartProvide a =CartProvide();


  @override
  void initState() {
    super.initState();
    listData.loadData();
  }

  CartProvide listData=CartProvide();
  DataBaseHelper? dbHelper = DataBaseHelper();



  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvide>(context);
    return (listData.itemlistview != null)
        ? Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: listData.itemlistview?.length,
                      itemBuilder: (context, index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: const Color(0xffc4a966),
                          child: ListTile(
                            leading: Container(
                              width: 60,
                              height: 80,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "${listData.itemlistview?[index].image}"),
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            title: Text(
                              listData.itemlistview?[index].name ?? '',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${listData.itemlistview?[index].price} /Rs",
                                  style: const TextStyle(color: Colors.black),
                                ),
                                //==========================================
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    RatingBar.builder(
                                      itemSize: 20,
                                      initialRating: 3,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemPadding: const EdgeInsets.symmetric(
                                          horizontal: .0),
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: Colors.pink,
                                      ),
                                      onRatingUpdate: (rating) {
                                        // print(rating);
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                            trailing: InkWell(
                              onTap: (){

                                //TODO: get data from db, check for id,
                                dbHelper!.insert(
                                    SweetList(
                                      // id: a.counter,
                                      id: listData.itemlistview?[index].id,
                                      name: listData.itemlistview?[index].name,
                                      image: listData.itemlistview?[index].image,
                                      price: listData.itemlistview?[index].price,
                                      // count: 1,
                                    )
                                ).then((value){
                                  print("product is added to cart");
                                  cart.addTotalPrice(double.parse(listData.itemlistview![index].price.toString()));
                                  cart.addCounter();

                                }).onError((error, stackTrace){
                                  print(error.toString());
                                });
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.yellowAccent,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: const [
                                      Text(
                                        "Add",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      Icon(
                                        Icons.add,
                                        size: 25,
                                        color: Colors.black,
                                      )
                                    ],
                                  )),
                            ),
                            // trailing: SizedBox(
                            //   height: 40,
                            //   width: 100,
                            //   child: Row(
                            //     children: [
                            //       Container(
                            //         width: 20,
                            //         height: 20,
                            //         decoration: BoxDecoration(
                            //           color: Colors.grey,
                            //           borderRadius: BorderRadius.circular(10),
                            //         ),
                            //         child: const Icon(
                            //           Icons.add,
                            //           color: Colors.white,
                            //           size: 16,
                            //         ),
                            //       ),
                            //       Padding(
                            //         padding: const EdgeInsets.symmetric(
                            //             horizontal: 8.0),
                            //         child: Text(
                            //           "$counter",
                            //           style: const TextStyle(
                            //               fontWeight: FontWeight.bold,
                            //               fontSize: 18),
                            //         ),
                            //       ),
                            //       Container(
                            //         width: 40,
                            //         height: 40,
                            //         decoration: BoxDecoration(
                            //           color: Colors.blue,
                            //           borderRadius: BorderRadius.circular(10),
                            //         ),
                            //         child: IconButton(
                            //           onPressed: () {
                            //             setState(() {
                            //               _increment();
                            //             });
                            //           },
                            //           icon: Icon(Icons.add),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          )
        :  const Center(child: CircularProgressIndicator());
  }
}
























// @override
// void initState(){
//   super.initState();
//   readJsonFile();
//
// }
// Future<ClientData?> readJsonFile() async {
//   final String response = await rootBundle.loadString("assets/jsonclientdata.json");
//   final clientData = await json.decode(response);
//
//   setState(() {
//     _data = ClientData.fromJson(clientData);
//
//     // .map((e) => ClientData.fromJson()
//   });
// Widget build(BuildContext context) {
//   return  (itemlistview != null)?Padding(
//     padding: const EdgeInsets.all(16.0),
//     child: ListView.builder(
//         itemCount: itemlistview?.length,
//         itemBuilder: (context , index){
//           return ListTile(
//             leading: Image.network("${itemlistview?[index].image}"),
//             title: Text("${itemlistview?[index].name}"),
//             subtitle:Text("${itemlistview?[index].price} /Rs") ,
//             // trailing: ,
//           );
//
//         }),
//   ):const CircularProgressIndicator();
// }
// }
// height: 50,child: Image.asset("${itemlistview?[index].image}",)),
