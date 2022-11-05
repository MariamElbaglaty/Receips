class Data{

late String title;
 int? id;
 String ? url;



Data(Map <String,dynamic> data)

{
  if (data['id']!=null)
{
  this.id=data['id'];}

  if (data['url']!=null)

  {this.url=data['url'];}
  this.title=data['title'];





}





Data.fromMap(Map <String,dynamic> data)
{
  this.id=data['id'];

  this.title=data['title'];

  

  this.url=data['url'];
}

Map <String,dynamic> toMap()

{
 
Map <String,dynamic> map={'title':this.title};

if (this.id!=null)
{
  map['id']=this.id;
}

if (this.url!=null)
{
  map['url']=this.url;
}

return map;
}


















}