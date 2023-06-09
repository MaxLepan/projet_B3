import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const white = Color(0xFFFEFAF4);
const beige = Color(0xFFFEFAF4);
const darkBeige = Color(0xFFF8F1E4);
const black = Color(0xFF242a2b);
const greenBrown = Color(0xFFd2c65e);
const MaterialColor materialGreeBrown = MaterialColor(0xFFE57373, {
  50: Color(0xfffff9d7),
  100: Color(0xfff1e8af),
  200: Color(0xffe8df9c),
  300: Color(0xffded387),
  400: Color(0xffd3c76f),
  500: Color(0xFFd2c65e),
  600: Color(0xffd2c443),
  700: Color(0xffc4b42c),
  800: Color(0xffc9b91d),
  900: Color(0xffdcca10),
});


const green = Color(0xFFA4C89A);
const blue = Color(0xFFB6ABD4);
const orange = Color(0xFFEBA15A);
const lightGreen = Color(0xFFebf0e3);
const lightBlue = Color(0xFFf3eeef);
const lightOrange = Color(0xFFfbecdc);

const beige_03 = Color(0xFFEFE5D6);

const horizontalPadding = EdgeInsets.only(left: 28, right: 28);
const smallHorizontalPadding = EdgeInsets.only(left: 19, right: 19);

var titleStyle = GoogleFonts.rubik(color: black, fontSize: 26, fontWeight: FontWeight.w500);
var titleItalicStyle = GoogleFonts.rubik(color: black, fontSize: 26, fontWeight: FontWeight.w500, fontStyle: FontStyle.italic);
var smallTitle = GoogleFonts.rubik(color: black, fontSize: 17, fontWeight: FontWeight.w500);

var textStyle = GoogleFonts.nunito(color: black, fontSize: 17);
var textItalicStyle = GoogleFonts.nunito(color: black, fontSize: 17, fontStyle: FontStyle.italic);
var textBoldStyle = GoogleFonts.nunito(color: black, fontSize: 17, fontWeight: FontWeight.bold);
var textMediumStyle = GoogleFonts.nunito(color: black, fontSize: 17, fontWeight: FontWeight.w500);