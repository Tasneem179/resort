import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("CostaResort",style: GoogleFonts.dancingScript(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),),
      backgroundColor: Colors.cyan,
    );
  }
}
