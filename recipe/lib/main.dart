import 'package:flutter/material.dart';
import 'package:recipe/details.dart';
import 'package:recipe/fav.dart';
import 'package:recipe/results.dart';
import 'api.dart';
import 'recipe.dart';
import 'package:flutter/cupertino.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      );
      
  }
      
           
      
      
      }
      class Home extends StatefulWidget {
        const Home({ Key? key }) : super(key: key);
      
        @override
        State<Home> createState() => _HomeState();
      }
      
      class _HomeState extends State<Home> {
        @override
        Widget build(BuildContext context) {
          return Scaffold(
            body: FutureBuilder<Recipe>(
              future: Api.my_api() ,
              builder: (context,snapshot)
              {

               if(!snapshot.hasData){
        return CircularProgressIndicator();}

        else{

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount:  snapshot.data!.results!.length,
          
              itemBuilder: (context,index)
              {
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
                        color: Colors.black,
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
         
                           image:NetworkImage(snapshot.data!.results![index].image!))

                       )), 
                       Text(snapshot.data!.results![index].title!,
                       style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize:20,
                       ),
                       
                       
                       ),

                     






                      ]),
                  ),
                 
                 onTap: ()  async{
                 await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context)=>Details(snapshot.data!.results![index].image!,snapshot.data!.results![index].title!))
                  );
                  setState(() {
                    
                  });
                 },

                ),


                

                 




                );
              }
       
        
        
        );
               
              }
              }
            
              
              
              
              
               ),
              
                bottomNavigationBar: BottomNavigationBar(
                  //backgroundColor: Colors.blue,
               
                 
                  onTap: (i) 
                   
                     {
                        if (i==1)
                {
                  
                   Navigator.of(context).push( 
                  MaterialPageRoute(
                      builder: (context)=>Fav(),
                  )

                    );

                 setState(() {
                   
                 });}
                    
                  },
                  items: [
                    BottomNavigationBarItem(
                      label: 'Home' 
                      ,
                    
                      icon: Icon(Icons.home,
                      color: Colors.blue,),
             
                      
                      ),

                      BottomNavigationBarItem(
                      label: 'Favorite',
                      icon: Icon(Icons.favorite,
                      color: Colors.red,),
                    
                      
                      
                      
                      ),

                  ]),


            
          );
        }
      }

     