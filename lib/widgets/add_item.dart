import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workshop_app/data/locations.dart';
import 'package:workshop_app/models/Location.dart';

class AddItem extends StatelessWidget{
  String name = '';

  String imageURL = '';

  String mapURL = '';

  final formKey = GlobalKey<FormState>();

  void _onSubmit(BuildContext context){
    final isValid = formKey.currentState!.validate();
    if(!isValid){
      return;
    }
    formKey.currentState!.save();
    locations.add(Location(name: name, imageUrl: imageURL, mapUrl: mapURL));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(padding: const EdgeInsets.all(24.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    label: Text('Place Name: ',style: GoogleFonts.poppins(fontSize: 16),),
                  ),
                  validator: (value) {
                    if(value == null || value.isEmpty || value.length<3){
                      return 'Please enter a valid name';
                    }
                  },
                  onSaved: (newValue) {
                    name = newValue!;
                  },
                ),
              )
              ,
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    label: Text('Image URL: ',style: GoogleFonts.poppins(fontSize: 16),),
                  ),
                  validator: (value) {
                    if(value == null || value.isEmpty || value.length<3){
                      return 'Please enter a valid url for the Image';
                    }
                  },
                  onSaved: (newValue) {
                    imageURL = newValue!;
                  },
                ),
              )
              ,
               SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    label: Text('Map URL: ',style: GoogleFonts.poppins(fontSize: 16),),
                  ),
                  validator: (value) {
                    if(value == null || value.isEmpty || value.length<3){
                      return 'Please enter a valid Map Url';
                    }
                  },
                  onSaved: (newValue) {
                    mapURL = newValue!;
                  },
                ),
              )
              ,
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){
                    _onSubmit(context);
                  }
    
          , child: Text('Save',style: GoogleFonts.poppins(fontSize: 16),)),
          SizedBox(width: 30,),
          TextButton(onPressed: (){
            Navigator.of(context).pop();
          }, child: Text('Cancel',style:GoogleFonts.poppins(fontSize: 16))),
                ],
              ),
            ],
          )
          ),
        ),
      ),
    )
    ;
  }
}

