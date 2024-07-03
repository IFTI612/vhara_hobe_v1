
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TTextTheme {
  static TextTheme lightTextTheme = TextTheme(

    headlineLarge: GoogleFonts.montserrat(color:Colors.black87,fontSize: 50,fontWeight: FontWeight.bold),
    titleMedium: GoogleFonts.montserrat(color:Colors.black87,fontSize: 16),
    bodyMedium: GoogleFonts.poppins(color: Colors.deepPurple, fontSize: 12),





  );
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: GoogleFonts.montserrat(color:Colors.white70,fontSize: 50,fontWeight: FontWeight.bold),
    titleMedium: GoogleFonts.montserrat(color:Colors.white70,fontSize: 16),
    bodyMedium: GoogleFonts.poppins(color: Colors.white60, fontSize: 12),

  );
}