
import 'results.dart';
class Recipe{

late int ?offset;
late int ?number;
late int ? totalResults;
late List <Results>?results;


Recipe({
  required this.number,
  required this.offset,
  required this.results,
  required this.totalResults});
 
Recipe.fromMap(Map <String,dynamic> map)

{
 this.offset=map['offset'] as int ;
 this.number=map['number'] as int;
 this.totalResults=map['totalResults'] as int;
 this.results=[];
 (map['results']as List).forEach((element) {this.results!.add(Results.fromMap(element));});



}

Map<String,dynamic> toMap()
{
  List temp=[];
  this.results!.forEach((element) {
    temp.add(element.toMap());});

Map <String,dynamic> map2={
'offset':this.offset,
'number':this.number,
'totalResults':this.totalResults,
'results': temp

};
return map2;




}




}