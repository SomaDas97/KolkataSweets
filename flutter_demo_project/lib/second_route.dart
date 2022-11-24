import 'package:flutter/material.dart';

class SecondRoute extends StatelessWidget {
   SecondRoute({Key? key}) : super(key: key);
final List<String> items=
    [
      "a = Apple","b = ball","c = Cat","d = Dog","E =Egg","F = Frog","g =Ground","h = Home"
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView(
          shrinkWrap: true,
          children: [
            Column(
              children: const [
                ListTile(
                  title: Text('Soma',
                      style: TextStyle(color: Colors.green, fontSize: 30)),
                  subtitle: Text("Sinchan",
                      style: TextStyle(color: Colors.pink, fontSize: 20)),
                  leading: Icon(
                    Icons.ice_skating,
                    color: Colors.amberAccent,
                    size: 50,
                  ),
                ),
                ListTile(
                  title: Text('Sanu',
                      style: TextStyle(color: Colors.green, fontSize: 30)),
                  subtitle: Text("Doremon",
                      style: TextStyle(color: Colors.pink, fontSize: 20)),
                  leading: Icon(
                    Icons.ice_skating,
                    color: Colors.amberAccent,
                    size: 50,
                  ),
                ),
                ListTile(
                  title: Text('Sholanki',
                      style: TextStyle(color: Colors.green, fontSize: 30)),
                  subtitle: Text("Hagimaru",
                      style: TextStyle(color: Colors.pink, fontSize: 20)),
                  leading: Icon(
                    Icons.ice_skating,
                    color: Colors.amberAccent,
                    size: 50,
                  ),
                ),
                ListTile(
                  title: Text('Surovita',
                      style: TextStyle(color: Colors.green, fontSize: 30)),
                  subtitle: Text("Hagimaru",
                      style: TextStyle(color: Colors.pink, fontSize: 20)),
                  leading: Icon(
                    Icons.account_box_sharp,
                    color: Colors.amberAccent,
                    size: 50,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              color: Colors.black,
            ),
            const SizedBox(
              height: 20,
            ),

            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 200,
                  width: 200,
                  decoration: const BoxDecoration(
                    color: Colors.pink,
                  ),
                ),
                Container(
                  // margin: EdgeInsets.fromLTRB(30 , 40 ,30 ,40),
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: const Text("ksbdjkwq"),
                ),
                CircleAvatar(
                  // maxRadius: 10,
                  radius: 20,
                  child: Container(
                    height: 15,
                    width: 15,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.yellow,
                    ),
                  ),
                )
              ],
            ),
            const Divider(
              color: Colors.black,
            ),
            GridView.builder(

               shrinkWrap: true,
              gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1.5,mainAxisSpacing: 10, crossAxisSpacing: 10
              ),
              itemCount: 6,

              itemBuilder: (ctx, index) {
                return Stack(
                  children:[ Container(
                    color: Colors.yellow,
                  ),
                    Container(
                      height: 50,
                    width : 100,
                    decoration: const  BoxDecoration(
                      color: Colors.yellow,
                    ),
                    )
                ],
                );
              },
            ),
            Scrollbar(
              child: ListView.builder(

                controller: ScrollController(),
                shrinkWrap: true,
                itemBuilder:(context, index) {
                  return Material(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ListTile(
                            title: Text(items[index]),
                          ),
                          const Divider(
                            height: 10,
                            thickness: 5,
                          )
                        ],
                      )
                  );
                },
                itemCount: items.length,
              ),
            ),
            SideBar(),

          ],
        ),
    );
  }
  Widget SideBar (){
    return Container(
      height: 300,
      width: 300,
      child: ListView(
        shrinkWrap: true,
        controller: ScrollController(),
        children: [
      ListTile(
      title: Text('Soma',
          style: TextStyle(color: Colors.green, fontSize: 30)),
      subtitle: Text("Sinchan",
          style: TextStyle(color: Colors.pink, fontSize: 20)),
      leading: Icon(
        Icons.ice_skating,
        color: Colors.amberAccent,
        size: 50,
      ),
    ),
    ListTile(
    title: Text('Sanu',
    style: TextStyle(color: Colors.green, fontSize: 30)),
    subtitle: Text("Doremon",
    style: TextStyle(color: Colors.pink, fontSize: 20)),
    leading: Icon(
    Icons.ice_skating,
    color: Colors.amberAccent,
    size: 50,
    ),
    ),
    ListTile(
    title: Text('Sholanki',
    style: TextStyle(color: Colors.green, fontSize: 30)),
    subtitle: Text("Hagimaru",
    style: TextStyle(color: Colors.pink, fontSize: 20)),
    leading: Icon(
    Icons.ice_skating,
    color: Colors.amberAccent,
    size: 50,
    ),
    ),
    ListTile(
    title: Text('Surovita',
    style: TextStyle(color: Colors.green, fontSize: 30)),
    subtitle: Text("Hagimaru",
    style: TextStyle(color: Colors.pink, fontSize: 20)),
    leading: Icon(
    Icons.account_box_sharp,
    color: Colors.amberAccent,
    size: 50,
    ),
    ),
          ListTile(
            title: Text('Surovita',
                style: TextStyle(color: Colors.green, fontSize: 30)),
            subtitle: Text("Hagimaru",
                style: TextStyle(color: Colors.pink, fontSize: 20)),
            leading: Icon(
              Icons.account_box_sharp,
              color: Colors.amberAccent,
              size: 50,
            ),
          ),
          ListTile(
            title: Text('Surovita',
                style: TextStyle(color: Colors.green, fontSize: 30)),
            subtitle: Text("Hagimaru",
                style: TextStyle(color: Colors.pink, fontSize: 20)),
            leading: Icon(
              Icons.account_box_sharp,
              color: Colors.amberAccent,
              size: 50,
            ),
          ),
          ListTile(
            title: Text('Surovita',
                style: TextStyle(color: Colors.green, fontSize: 30)),
            subtitle: Text("Hagimaru",
                style: TextStyle(color: Colors.pink, fontSize: 20)),
            leading: Icon(
              Icons.account_box_sharp,
              color: Colors.amberAccent,
              size: 50,
            ),
          ),

        ],
      )
    );


  }
}
