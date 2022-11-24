import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_project/new_app/sweets_listclass.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import 'cart_provider.dart';
import 'database_helper.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {

  DataBaseHelper? dbHelper = DataBaseHelper();
  
  @override
  Widget build(BuildContext context) {

    int counter = 0;

    void _increment() {
      counter++;
    }
    var rating = 0.0;

    final cart = Provider.of<CartProvide>(context,listen: false);
    return Scaffold(
      appBar: AppBar (
        backgroundColor: const Color(0xfff3df79),
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "My Products",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        actions: [
          const CircleAvatar(
            backgroundColor: Color(0xffc4a966),
            radius: 15,
            child: Icon(
              Icons.account_circle,
              size: 20,
              color: Colors.black,
            ),
          ),

          // -------------------------------------------------------add to cart
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CircleAvatar(
                backgroundColor: const Color(0xffc4a966),
                radius: 15,
                child: Center(
                  child: Badge(
                    badgeContent: Consumer<CartProvide>(
                      builder: (context, value, child) {
                        return Text(value.getCounter().toString());
                      },
                    ),
                    animationDuration: const Duration(milliseconds: 300),
                    badgeColor: Colors.pink,
                    child: const Icon(
                      Icons.shopping_bag_outlined,
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                )),
          ),
        ],
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder(
              future: cart.getData(),
              builder: (context, AsyncSnapshot<List<SweetList>> snapshot) {
                // if (snapshot.hasError) {
                //   print("SOMETHING WENT WRONG=============ljhkgjfdg");
                //
                //   return const Text("SOMETHING WENT WRONG");
                // }
                if (snapshot.hasData) {
//                   print(
//                       "${snapshot.hasData} ==+++++++++++++++++++++++++++===========ljhkgjfdg");
// print("objecthrlloooooooooooooooooooooooo======${snapshot.data?.length}");


                   return (snapshot.data!).isEmpty ? const Text(" No ") : Expanded(
                     child: Column(
                       children: [
                         Expanded(
                           child: ListView.builder(
                              shrinkWrap: true,
                              itemCount:snapshot.data!.length,
                              itemBuilder: (context, index) {
                                // print(
                                //     "${snapshot.hasData} +++++++++++${snapshot.data?.length}==+++sssssssssssssss===ljhkgjfdg");
                                return ListTile(
                                  leading: Container(
                                    width: 60,
                                    height: 80,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "${snapshot.data?[index].image}"),
                                        ),
                                        borderRadius: BorderRadius.circular(10)),
                                  ),
                                  title: Text(
                                    "${snapshot.data?[index].name}",
                                    style:
                                        const TextStyle(fontWeight: FontWeight.bold),
                                  ),

                                  subtitle: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${snapshot.data?[index].price} /Rs",
                                        style: const TextStyle(color: Colors.black),
                                      ),
                                      //==========================================
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: const [
                                          // RatingBar.builder(
                                          //   itemSize: 20,
                                          //   initialRating: 3,
                                          //   minRating: 1,
                                          //   direction: Axis.horizontal,
                                          //   allowHalfRating: true,
                                          //   itemCount: 5,
                                          //   itemPadding: const EdgeInsets.symmetric(
                                          //       horizontal: .0),
                                          //   itemBuilder: (context, _) => const Icon(
                                          //     Icons.star,
                                          //     color: Colors.pink,
                                          //   ),
                                          //   onRatingUpdate: (rating) {
                                          //     // print(rating);
                                          //   },
                                          // ),
                                        ],
                                      ),
                                      InkWell(
                                        onTap: (){
                                          setState((){
                                            cart.deleteItem(index);
                                            cart.removeTotalPrice(double.parse(snapshot.data![index].price.toString()));
                                          });                                          // dbHelper!.delete(snapshot.data![index].id!);
                                          // cart.removeCounter();
                                          //

                                        },
                                        child:const  Icon(Icons.delete),)

                                    ],
                                  ),
                                  // trailing: InkWell(
                                  //   onTap: (){
                                  //     dbHelper!.insert(
                                  //         SweetList(
                                  //           id: index,
                                  //           name: listData.itemlistview?[index].name,
                                  //           image: listData.itemlistview?[index].image,
                                  //           price: listData.itemlistview?[index].price,
                                  //         )
                                  //     ).then((value){
                                  //       print("product is added to cart");
                                  //       cart.addTotalPrice(double.parse(listData.itemlistview![index].price.toString()));
                                  //       cart.addCounter();
                                  //
                                  //     }).onError((error, stackTrace){
                                  //       print(error.toString());
                                  //     });
                                  //   },
                                  trailing: Container(
                                      alignment: Alignment.center,
                                      height: 40,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          color: Colors.yellowAccent,
                                          borderRadius: BorderRadius.circular(20)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children:  [
                                          const Icon(Icons.remove),
                                          Text(
                                              (snapshot.data![index].id.toString()),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                          const Icon(
                                            Icons.add,
                                            size: 25,
                                            color: Colors.black,
                                          )
                                        ],
                                      )),


                                );
                              }),
                         ),
                       ],
                     ),
                   );
                  // : const Center(child:Text("No Items In Cart"));
                }
                return const Center(child: CircularProgressIndicator());
              }),

          Consumer<CartProvide>(builder: (context, value, child) {
            return Visibility(
              visible: value.getTotalPrice().toStringAsFixed(2) == "0.00" ? false : true,
              child: Column(
                children: [
                  ReusableWidget(
                    title: "SubTotal",
                    value: r"$" + value.getTotalPrice().toStringAsFixed(2),
                  )
                ],
              ),
            );
          })
          // const SizedBox(
          //   height: 600,
          // ),

        ],
      ),
    );
  }
}

class ReusableWidget extends StatelessWidget {
  final String title, value;
  const ReusableWidget({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(
            value.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )
        ],
      ),
    );
  }
}

//trailing: SizedBox(
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
