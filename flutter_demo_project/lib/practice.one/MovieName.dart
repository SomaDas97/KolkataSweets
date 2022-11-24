import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/MovieChoose.dart';
import 'FavMovie_Select.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => MovieChoose(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Movie Name',
      home: ProviderMovie(),
    );
  }
}

class ProviderMovie extends StatelessWidget {
  const ProviderMovie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fav = context.watch<MovieChoose>().favList;

      if (kDebugMode) {
        print("hii");
      }


    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) =>  FavMovieList()));
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title:  Text("Movie Name List : ${fav.length}"),
      ),
      body: ListView.builder(
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text("Movie $index"),
              trailing: GestureDetector(
                  onTap: () {
                    if (!fav.contains(index)) {

                      context.read<MovieChoose>().addtoList(index);
                    } else {
                      context.read<MovieChoose>().removeList(index);
                      // Provider.of<MovieChoose>(context , listen: false).removeList(index);
                    }
                  },
                  child: Icon(Icons.favorite,
                      color: fav.contains(index) ? Colors.red : Colors.grey),
              ),
            );
          }),
    );
  }
}
