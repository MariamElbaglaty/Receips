import 'package:flutter/material.dart';
import 'package:recipe/data.dart';
import 'package:recipe/results.dart';
import 'api.dart';
import 'recipe.dart';
import 'data_base.dart';



class Details extends StatefulWidget {

String url;
String title;
Details(this.url,this.title);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
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
        backgroundColor: Colors.green,
        title: Text('Details',
        style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20,
                      ),
        
        
        
        
        ) ,
        centerTitle: true,
      ),

body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                   Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              
                               image:DecorationImage(
                               fit: BoxFit.cover,
             
                               image:NetworkImage(widget.url))
      
                           )
                           ),
                      Text(widget.title,
                      
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                          fontSize: 20,
                      ),
                      
                      
                      ),
                    
                 ] )






                         )
                           ),
                           
                           
                           floatingActionButton: FloatingActionButton(
                           child: Icon(Icons.favorite),
                           backgroundColor: Colors.red,
                            onPressed: ()
                            async{
                                 Data mine= Data({'title':widget.title,'url':widget.url});
                                 await help.create_receipe(mine);
                                 setState(() {
                                   
                                 });
                            }
                            ),
                           );

                            
    
  }
}