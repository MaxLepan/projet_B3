import 'dart:math';

import 'package:flutter/material.dart';
import 'package:projet_b3/Fun_facts/fun_facts_model.dart';
import 'package:projet_b3/Species/species_model.dart';
import 'package:projet_b3/Themes/colors.dart';

import '../Icons/custom_icons.dart';

class SpeciesViewBlockFunFact extends StatelessWidget {
  final FunFact funFact;
  final Color mainColor;
  final Color secondaryColor;

  const SpeciesViewBlockFunFact(
      {super.key, required this.funFact, required this.mainColor, required this.secondaryColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 30, top: 30),
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
              if(funFact.title != "")
                Container(
                  margin: const EdgeInsets.only(top: 16, bottom: 6),
                  child: Transform.rotate(
                    angle: -3.86 * (pi / 180),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3.0),
                          color: mainColor
                      ),
                      padding: const EdgeInsets.all(10.0),
                      child: Text(funFact.title!, style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 18, fontWeight: FontWeight.w500, color: black),),
                    ),
                  ),
                ),
              if(funFact.description != "")
                Container(
                  padding: const EdgeInsets.only(top: 6, bottom: 6),
                  child: Text(funFact.description!, style: const TextStyle(fontWeight: FontWeight.w500, color: black, fontSize: 17),),
                ),
              if(funFact.text != "")
                Container(
                  padding: const EdgeInsets.only(top: 6, bottom: 6),
                  child: Text(funFact.text!, style: textStyle,),
                ),
              if(funFact.image != null)
                Container(
                  padding: const EdgeInsets.only(top: 6, bottom: 6),
                  child: Image.network(
                    funFact.image!,
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