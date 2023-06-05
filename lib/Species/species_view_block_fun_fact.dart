import 'dart:math';

import 'package:flutter/material.dart';
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
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 30, top: 30),
      color: highlighted == false ? white : darkBeige,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.0),
          color: secondaryColor,
        ),
        child: Padding(
          padding: horizontalPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if(funFact!["title"] != "")
                Container(
                  margin: const EdgeInsets.only(top: 16, bottom: 6),
                  child: Transform.rotate(
                    angle: -3.86 * (pi / 180),
                    child: Text(funFact!["title"], style: const TextStyle(color: black, fontSize: 21, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                  ),
                ),
              if(funFact!["subtitle"] != null)
                Container(
                  padding: const EdgeInsets.only(top: 6, bottom: 6),
                  child: Text(funFact!["subtitle"], style: const TextStyle(fontWeight: FontWeight.w500, color: black, fontSize: 17),),
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
    );
  }
}