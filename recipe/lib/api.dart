import 'dart:convert';

import 'recipe.dart';
import 'package:http/http.dart';
class Api{

static Future <Recipe> my_api()
async{
   Response req= await get(Uri.parse('https://api.spoonacular.com/recipes/complexSearch?&apiKey=aa9753a35fcc4b89b074e7d40feda8e9'));
  print(req.body);


  if (req.statusCode==200)
  {    

    Recipe mine=Recipe.fromMap(json.decode(req.body));
  
    
    
   return mine;
  
  }
  else
  throw('Request fail');

}













}