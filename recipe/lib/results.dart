class Results{

 late int ?id;
 late String ?title;
 late String ?image;
 late String ?imageType;

Results({required this.id,
required this.image,
required this.imageType,
required this.title});


Results.fromMap(Map<String,dynamic> map)


{ 
  this.id=map['id'] as int;
  this.title=map['title'] as String ;
  this.image=map['image'] as String ;
  this.imageType=map['imageType'] as String;

}

Map <String,dynamic> toMap()
{
  Map <String,dynamic>map1={

    'id':this.id,
    'title':this.title,
    'image':this.image,
    'imageType':this.imageType


  };
  return map1;



}


}