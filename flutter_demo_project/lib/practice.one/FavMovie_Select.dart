import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/MovieChoose.dart';

class FavMovieList extends StatefulWidget {
   FavMovieList({Key? key}) : super(key: key);

  @override
  State<FavMovieList> createState() => _FavMovieListState();
}

class _FavMovieListState extends State<FavMovieList> {
  int _ci=0;

  @override
  Widget build(BuildContext context) {

    var fav = context.watch<MovieChoose>().favList;

    return Scaffold(
      appBar: AppBar(title: const Text("Favorite Movie"),),

      body: ListView.builder(
        itemCount: fav.length,
          itemBuilder:(BuildContext context , int index){
        return ListTile(
          title: Text("Movie ${fav[index]}"),
          trailing: TextButton(
            onPressed: (){
              context.read<MovieChoose>(). removeList(fav[index]);
              // if(context.read<MovieChoose>().fav[index]>5){
              //   context.read<MovieChoose>(). removeList(fav[index]);
              // }else{
              //   print("hvjva");
              // }
            },
            child: const Text("Remove", style: TextStyle(color: Colors.red),),
          ),
        );
    }
      ),
        bottomNavigationBar:BottomNavigationBar(
          onTap: (val){
Provider.of<MovieChoose>(context,listen: false).changeval(val);
            // setState(() {
            //   _ci=val;
            // });
          },
currentIndex:Provider.of<MovieChoose>(context,listen: false).ci,


          // unselectedFontSize: 0.0,
          // selectedFontSize: 0.0,
          type: BottomNavigationBarType.shifting,
          backgroundColor: Colors.grey,


          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: "jkhg",backgroundColor: Colors.black),
            BottomNavigationBarItem(icon: Icon(Icons.add_business),label: "kihgfd",backgroundColor: Colors.blue),
            BottomNavigationBarItem(icon: Icon(Icons.contact_page_outlined),label: "kihgfd",backgroundColor: Colors.red),
            BottomNavigationBarItem(icon: Icon(Icons.account_box_sharp),label: "mjghfd",backgroundColor: Colors.pink),
          ],

        ) ,


    );
  }
}
