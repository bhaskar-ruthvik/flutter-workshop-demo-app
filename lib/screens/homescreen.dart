import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workshop_app/data/locations.dart';
import 'package:workshop_app/widgets/add_item.dart';
import 'package:workshop_app/widgets/list_item.dart';
import 'dart:io' show Platform;

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final borders = Platform.isAndroid ? 16.0 : 25.0;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        toolbarHeight: 120,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(borders))
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title:Padding(
          padding: const EdgeInsets.fromLTRB(2,36,0,0),
          child: Row(
            children: [
              Icon(Icons.location_on,size:28),
              Text('Locations',style: GoogleFonts.poppins(fontSize: 32,fontWeight: FontWeight.bold),),
            ],
          )
          ,)
      ),
      body: SafeArea(
        child: 
            Stack(
              children: [
             
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,16.0,0,0),
                    child: ListView.builder(
                      itemCount: locations.length,
                      itemBuilder: (ctx,index){
                        return 
                          ListItem(location: locations[index]);
                        
                      }),
                  ),
              
                Positioned(
                  
                  bottom: 0,
                  left: 90,
                  right:90,
                  child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                child:  SizedBox(
                  height: 60,
                  child: 
                  ElevatedButton(
                    onPressed: () async {
                     await Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                        return AddItem();
                      }));
                      setState(() {
                        
                      });
                    },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add
                      ),
                      SizedBox(height: 10,),
                      Text('Add New Place',
                      style: GoogleFonts.poppins(color: Theme.of(context).colorScheme.onPrimaryContainer,fontSize: 20),)
                    ],
                  )),
                ),
                ),
                  ),
                
              ],
            )
        
      )
      ,
      
    );
  }
}