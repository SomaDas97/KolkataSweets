import 'package:flutter/material.dart';
void main() {
  runApp(MaterialApp(
    title: "My App",
    home: HomePage(),
    theme: ThemeData(primarySwatch: Colors.blue),
  ));
}
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.teal,
        appBar: AppBar(
          title: Text("My App"),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Icon(Icons.favorite , color: Colors.redAccent, size: 40,),
            ),
          ],
        ),
        body: Center(
        child: Column(
        children: [
        Padding(
        padding: const EdgeInsets.all(50.0),
    child: Container(
    height: 250,
    width: 300,
    decoration: BoxDecoration(
    border: Border.all(width: 4,color: Colors.white),
    borderRadius: BorderRadius.circular(30),
    color: Colors.white,
    image: DecorationImage(image: AssetImage(
    "asset/background.png"),fit: BoxFit.fill),
    ),
    ),
    ),
    Row(
    children: <Widget>[
    Padding(
    padding: const EdgeInsets.only(left: 30),
    child: Text(
    "T Vamsi Krishna",
    style: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600
    ),
    ),
    ),
    Padding(
    padding: const EdgeInsets.only(left: 30),
    child: Text(
    "28 Years Old",
    style: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600
    ),
    ),
    ),
    ],
    ),
    SizedBox(
    height: 20,
    ),
    Row(
    children: [
    Padding(
    padding: const EdgeInsets.only(left: 60),
    child: Padding(
    padding: const EdgeInsets.only(right: 20),
    child: Icon(Icons.call , color: Colors.red,),
    ),
    ),
    Text(
    "+91  9999999999",
    style: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600
    ),
    ),
    ],
    ),
    SizedBox(
    height: 20,
    ),
    Row(
    children: [
    Padding(
    padding: const EdgeInsets.only(left: 60),
    child: Padding(
    padding: const EdgeInsets.only(right: 20),
    child: Icon(Icons.email , color: Colors.red,),
    ),
    ),
    Text(
    "vansi.t@techouts.com",
    style: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    ),
    )
    ],
    )
    ],
    ),
    ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // DrawerHeader(child: Text(
            //     "Hi , I am Drawer",
            //         style: TextStyle(color: Colors.white ),
            // ),
            //   decoration: BoxDecoration(color: Colors.purple),
            // ),
            UserAccountsDrawerHeader(
              accountName: Text("Soma Das"),
              accountEmail: Text("somadas.vms@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1481214110143-ed630356e1bb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8d29tZW58ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Account"),
              subtitle: Text("Personal"),
              trailing: Icon(Icons.edit),
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text("Email"),
              subtitle: Text("somadas.vms@gmail.com"),
              trailing: Icon(Icons.send),
            ),
            ListTile(
              leading: Icon(Icons.call),
              title: Text("Phone Number"),
              subtitle: Text("+91__________"),
              trailing: Icon(Icons.edit),
            ),
            ListTile(
              leading: Icon(Icons.date_range),
              title: Text("Date Of Birth"),
              subtitle: Text("DD/MM/YYYY"),
              trailing: Icon(Icons.edit),
            ),
            ListTile(
              leading: Icon(Icons.location_city),
              title: Text("Address"),
              subtitle: Text("Current Address"),
              trailing: Icon(Icons.edit),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.edit),
      ),
    );
  }
}