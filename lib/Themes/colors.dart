import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const white = Color(0xFFFEFAF4);

const beige = Color(0xFFFEFAF4);
const beigeTransparent = Color(0x99FEFAF4);
const darkBeige = Color(0xFFF8F1E4);
const darkerBeige = Color(0xFFf3eadc);
const beige_01 = Color(0xFFFFFCF8);
const beige_02 = Color(0xF8F1E4);
const beige_03 = Color(0xFFEFE5D6);
const beige_04 = Color(0xFFE5DAC8);

const black = Color(0xFF242a2b);
const black_01 = Color(0xFFaeb5ab);
const black_04 = Color(0xFF6B726A);

const greenBrown = Color(0xFFD2C65E);
const greenBrown_02 = Color(0xFFDCD383);

const sapin_01 = Color(0xFFA4C7BA);

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
const lightGreen = Color(0xFFebf0e3);

const blue = Color(0xFFB6ABD4);
const lightBlue = Color(0xFFf3eeef);

const orange = Color(0xFFEBA15A);
const lightOrange = Color(0xFFfbecdc);

const red = Color(0xFFEA9D9D);
const lightRed = Color(0xFFFAE7E2);


const mint_01 = Color(0xFFbfdaba);
const mint_02 = Color(0xFFa4c89a);

const orange_01 = Color(0xFFeeb67e);
const orange_02 = Color(0xFFeba15a);

const purple_01 = Color(0xFFc6bfdb);
const purple_02 = Color(0xFFa398c2);

const strawberry_01 = Color(0xFFea9d9d);
const strawberry_02 = Color(0xFFe17e7e);
const strawberry_03 = Color(0xFFD95A5A);

const horizontalPadding = EdgeInsets.only(left: 28, right: 28);
const smallHorizontalPadding = EdgeInsets.only(left: 19, right: 19);

var bigTitleStyle = GoogleFonts.rubik(color: black, fontSize: 30, fontWeight: FontWeight.w500);
var titleStyle = GoogleFonts.rubik(color: black, fontSize: 26, fontWeight: FontWeight.w500);
var titleItalicStyle = GoogleFonts.rubik(color: black, fontSize: 26, fontWeight: FontWeight.w500, fontStyle: FontStyle.italic);
var smallTitle = GoogleFonts.rubik(color: black, fontSize: 17, fontWeight: FontWeight.w500);

var textStyle = GoogleFonts.nunito(color: black, fontSize: 17);
var textItalicStyle = GoogleFonts.nunito(color: black, fontSize: 17, fontStyle: FontStyle.italic);
var textBoldItalicStyle = GoogleFonts.nunito(color: black, fontSize: 17, fontWeight: FontWeight.w400 ,fontStyle: FontStyle.italic);
var textBoldStyle = GoogleFonts.nunito(color: black, fontSize: 17, fontWeight: FontWeight.bold);
var textMediumStyle = GoogleFonts.nunito(color: black, fontSize: 17, fontWeight: FontWeight.w500);
var textUnderlineStyle = GoogleFonts.nunito(color: black, fontSize: 17, decoration: TextDecoration.underline, fontWeight: FontWeight.bold);

const double appBarIconeSize = 45;


Widget imageWithPlaceholder(String imagepath, double height){
  return ExtendedImage.network(
    imagepath,
    height: height,
    width: double.infinity,
    fit: BoxFit.cover,
    borderRadius: const BorderRadius.all(Radius.circular(5)),
    cache: true,
    loadStateChanged: (ExtendedImageState state) {
      switch (state.extendedImageLoadState) {
        case LoadState.loading:
          return Container(
            color: Colors.grey,
          );
        case LoadState.completed:
          return null;
        case LoadState.failed:
          return Container(
            color: greenBrown,
          );
      }
    },
  );
}
