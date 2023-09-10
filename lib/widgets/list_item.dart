import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:workshop_app/models/Location.dart';
import 'package:url_launcher/url_launcher.dart';



class ListItem extends StatelessWidget{
  const ListItem({super.key, required this.location});
  final Location location;
  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.fromLTRB(8,6.0,8,6.0),
      child: InkWell(
        onTap: () async {
          final Uri _url = Uri.parse(location.mapUrl);
          if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
        },
        child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    clipBehavior: Clip.hardEdge,
                    elevation: 2,
                    child: Stack(
                      children: [
                        FadeInImage(
                          placeholder: MemoryImage(kTransparentImage),
                          image: NetworkImage(location.imageUrl),
                          fit: BoxFit.cover,
                          height: 200,
                          width: double.infinity,
                        ),
                        Positioned(
                          top: 0,
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            alignment: Alignment.center,
                            color: const Color.fromARGB(65, 0, 0, 0),
                           
                            child: 
                                Text(
                                  location.name,
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22,
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                ),
                  
                          ),
                        ),
                      ],
                    )),
      ),
    )
                ;
  }
}