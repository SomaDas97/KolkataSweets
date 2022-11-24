import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'add_to_cart.dart';
import 'cart_provider.dart';
import 'categories_widget.dart';
import 'database_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const Drawer(),
        appBar: AppBar(
          backgroundColor:const  Color(0xfff3df79),
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text(
            "Home",
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
          actions:  [
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
                child: InkWell(
                  onTap: (){
                    Navigator.push(context , MaterialPageRoute(builder: (context) =>const Cart()));
                  },
                  child: Center(
                    child: Badge(
                      badgeContent: Consumer<CartProvide>(
                        builder: (context , value , child){
                          return  Text(value.getCounter().toString());
                        },
    ),
                      animationDuration: const Duration(milliseconds: 300),
                      badgeColor: Colors.pink,
                      child:const Icon(Icons.shopping_bag_outlined,
                        size: 20, color: Colors.black ,
                      ),
                    ),
                  ),
                )
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("asset/new_app/sweets1.png"),
                  ),
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 120),
                              child: Container(
                                height: 40,
                                width: 120,
                                decoration: const BoxDecoration(
                                    color: Color(0xff7eccbc),
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(15))),
                                child: const Text(
                                  "Kolkata Sweets",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white60,
                                      shadows: [
                                        BoxShadow(
                                          blurRadius: 3,
                                          color: Colors.redAccent,
                                          offset: Offset(2, 2),
                                        ),
                                      ]),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 20, right: 15),
                              child: Text(
                                "30% Off",
                                style: TextStyle(
                                    fontSize: 40,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      BoxShadow(
                                          blurRadius: 5,
                                          color: Colors.redAccent,
                                          offset: Offset(4, 4)),
                                    ]),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(right: 10, top: 6),
                              child: Text(
                                "On all Sweets ....",
                                style: TextStyle(fontSize: 19, color: Colors.red),
                              ),
                            )
                          ],
                        )),
                    Expanded(child: Container()),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                        // color: Colors.grey,
                        //border: Border.fromBorderSide(BorderSide(width: 2)),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: (){

                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 10),
                            width: 350,
                            child: TextFormField(
                                decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              prefixIcon: Icon(Icons.search),
                              hintText: "Search here....",
                              suffixIcon: Icon(Icons.filter_list),

                            )),
                          ),
                        ),
                        // Spacer(),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(top: 30),
                  decoration: const BoxDecoration(
                      color: Color(0xfff3df79),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      )),
                 child: const CategoriesWidget(),
                ),
              ),
            ],
          ),
        ));
  }
}
