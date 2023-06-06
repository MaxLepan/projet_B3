import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projet_b3/Themes/colors.dart';


class SpeciesViewBlockFunFact extends StatelessWidget {
  final Map? funFact;
  final Color mainColor;
  final Color secondaryColor;
  final bool highlighted;

  const SpeciesViewBlockFunFact(
      {super.key, required this.funFact, required this.mainColor, required this.secondaryColor, required this.highlighted});

  @override
  Widget build(BuildContext context) {
    return
      Container(
        color: highlighted == false ? white : darkBeige,
        child: Container(
          padding: horizontalPadding,
          margin: const EdgeInsets.only(bottom: 30, top: 30),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.0),
                color: secondaryColor,
              ),
              child: Container(
                padding: smallHorizontalPadding,
                margin: EdgeInsets.only(bottom: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    if(funFact!["title"] != "")
                      Container(
                        margin: const EdgeInsets.only(top: 30, bottom: 30),
                        child: Transform.rotate(
                          angle: -5.86 * (pi / 180),
                          child: Text(funFact!["title"], style: GoogleFonts.rubik(color: black, fontSize: 26, fontWeight: FontWeight.w500, fontStyle: FontStyle.italic),),
                        ),
                      ),
                    if(funFact!["subtitle"] != null)
                      Container(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Text(funFact!["subtitle"], style: textBoldStyle,),
                      ),
                    if(funFact!["text"] != null)
                      Container(
                        padding: const EdgeInsets.only(top: 6, bottom: 6),
                        child: Text(funFact!["text"], style: textStyle,),
                      ),
                    if(funFact!["image_url"] != null)
                      Container(
                        padding: const EdgeInsets.only(top: 6, bottom: 6),
                        child: Image.network(
                          funFact!["image_url"],
                          fit: BoxFit.contain,
                          width: 299,
                          height: 100,
                        ),
                      ),
                  ],
                ),
              )
          ),
        ),
      );
  }
}