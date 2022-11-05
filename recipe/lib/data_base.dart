import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'data.dart';

class Dphelper{

static final Dphelper instance=Dphelper.internal();

factory Dphelper()=>instance;

Dphelper.internal(){}



 createDatabase()


async{
  Database db;
  WidgetsFlutterBinding.ensureInitialized();
  
  String path= join(await getDatabasesPath(),'book.db');


   db=await openDatabase(path,version: 1,onCreate: (Database Db,int v){ 
    Db.execute('CREATE TABLE recipe (id INTEGER PRIMARY KEY, title TEXT, url TEXT )');

   });
   return db;


}



Future <Data> create_receipe(Data my_recipe)

async {
   Database DP= await createDatabase();

   my_recipe.id = await DP.insert('recipe', my_recipe.toMap());
   return my_recipe;

}


Future<List> allreceips()
async {
   Database DP= await createDatabase();
     return DP.query('recipe');


}

























}
