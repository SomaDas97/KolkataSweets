import 'package:flutter/material.dart';
import 'package:flutter_demo_project/new_app/sweets_screen.dart';
import 'ice-creem_screen.dart';
import 'namkeen_screen.dart';


class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {

    TabController tabController = TabController(length: 3, vsync: this);

    return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
      Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
        child: Row(
          //crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "Category",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              "See All",
              style: TextStyle(fontSize: 15, color: Colors.black),
            )
          ],
        ),
      ),
      Expanded(
        child: DefaultTabController(
          length: 3,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Card(
              color: const Color(0xffc4a966),
              child: TabBar(
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.yellow,
                ),
                isScrollable: true,
                labelPadding: const EdgeInsets.symmetric(horizontal: 30),
                tabs: const [
                  Tab(
                    child: Text(
                      "Sweets",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Namkeen",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Ice-Cream",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(color: Colors.white,thickness: 5),
             const Expanded(
              child: TabBarView(children: [
                SweetsScreen(),
                NamkeenScreen(),
                IceCreemScreen(),
              ]),
            )
          ],
          ),
        ),
      ),
    ]
    );
  }
}

