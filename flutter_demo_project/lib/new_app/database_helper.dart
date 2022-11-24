import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'sweets_listclass.dart';

class DataBaseHelper{
   static Database? _db;

   Future<Database?> get db async{
      if(_db != null){
        return _db!;
      }

      _db = await initDatabase();
      return null;
   }

   initDatabase()async{
     io.Directory documentdirectory = await getApplicationDocumentsDirectory();
     String path = join(documentdirectory.path , "cart.db");
     var db = await openDatabase(path, version: 1 , onCreate:_onCreate);
     return db ;

   }

   _onCreate (Database db , int version) async{
     await db.execute(
         "CREATE TABLE cart(id INTEGER PRIMARY KEY ,name TEXT,image TEXT ,price INTEGER)"
     );

   }
   Future<SweetList> insert(SweetList cart)async{
     var dbClient = await db;
     await dbClient!.insert('cart' , cart.toMap());
     return cart;

   }

   Future<List<SweetList>> getCartList()async{
     var dbClient = await db;
     final List<Map<String , Object?>> queryResult = await dbClient!.query('cart');
     print('cart list: $queryResult');
    return queryResult.map((e) => SweetList.fromMap(e)).toList();
   }

  Future<int> delete(int id)async{
    var dbClient = await db;
    return await dbClient!.delete(
      "cart",
          where: "id =?",
      whereArgs: [id]
    );
  }








}