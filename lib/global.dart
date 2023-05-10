import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Global{

  static String base_url = 'https://randomuser.me/api/?results=';
  static String pepole = "5";
  static TextEditingController controller = TextEditingController();
}


class FontStyle{

  static var title = GoogleFonts.lato(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold);
  static var subtitle = GoogleFonts.lato(fontSize: 14,color: Colors.grey.shade400,fontWeight: FontWeight.w400);
}