import 'package:flutter/material.dart';
import 'data_base.dart';
import 'data.dart';
class Fav extends StatefulWidget {
  const Fav({ Key? key }) : super(key: key);

  @override
  State<Fav> createState() => _FavState();
}

class _FavState extends State<Fav> {
   late Dphelper help;
  @override
void initState() {
    // TODO: implement initState
    super.initState();
   help=Dphelper();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text('Favourite Receips',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),
        
        
        ),
      ),

      body: FutureBuilder(
        future: help.allreceips(),
        builder: (Context,AsyncSnapshot snapshot)
        {

           if(!snapshot.hasData){
        return CircularProgressIndicator();}

        else{

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount:  snapshot.data.length,
          
              itemBuilder: (context,index)
              {
                Data m= Data.fromMap(snapshot.data[index]);
          //Results m = Results.fromMap(snapshot.data!.results![index]);
             
              return Padding(
                padding: EdgeInsets.all(10),
                child: GestureDetector(
                child: Container(
                  height: 150,
                  width: 150,
                  
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.red,
                        width: 3
                      )
                  ),
                  

                 
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      
                      
                      children: [
                       
                       Container(
                        height: 90,
                        width: 150,
                        decoration: BoxDecoration(
                          
                           image:DecorationImage(
                           fit: BoxFit.cover,
         
                           image:NetworkImage(m.url!))

                       )), 
                       Text(m.title,
                       style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize:20,
                       ),
                       
                       
                       ),

                     






                      ]),
                  ),
              
                 

                ),


                

                 




                );
              }
       
        
        
        );
               
              }
              }));
              }}
            







      







