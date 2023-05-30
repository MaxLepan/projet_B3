import 'dart:math';

import 'package:flutter/material.dart';
import 'package:projet_b3/Content_three_pics/content_three_pics.dart';
import 'package:projet_b3/Species/species_model.dart';
import 'package:projet_b3/Themes/colors.dart';

import '../Content_simple/content_simple_model.dart';
import '../Icons/custom_icons.dart';

class SpeciesViewBlockThreePics extends StatelessWidget {
  final ContentThreePics content;
  final Color mainColor;

  const SpeciesViewBlockThreePics(
      {super.key, required this.content, required this.mainColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: horizontalPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(content.title != null)
            Container(
              padding: const EdgeInsets.only(top: 16),
              child: Text(content.title!, style: titleStyle,),
            ),
          if(content.tag != null)
            Container(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                margin: const EdgeInsets.only(right: 8, bottom: 8),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.circular(3.0),
                ),
                child: Text(
                  content.tag!,
                  style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                ),
              ),
            ),
          Padding(
            padding: EdgeInsets.only(top:5, bottom:15),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      if(content.image1 != null)
                        Image.network(content.image1!),
                      if(content.legend1 != null)
                        Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: Text(content.legend1!, style: const TextStyle(fontSize: 18, color: black), textAlign: TextAlign.center),
                        ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      if(content.image2 != null)
                        Image.network(content.image2!),
                      if(content.legend2 != null)
                        Padding(
                          padding: EdgeInsets.only(top: 8, left: 6, right : 6),
                          child: Text(content.legend2!, style: const TextStyle(fontSize: 18, color: black), textAlign: TextAlign.center),
                        ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      if(content.image3 != null)
                        Image.network(content.image3!),
                      if(content.legend3 != null)
                        Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: Text(content.legend3!, style: const TextStyle(fontSize: 18, color: black), textAlign: TextAlign.center),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          if(content.imageBig != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FractionallySizedBox(
                  widthFactor: 1.0,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Image.network(content.imageBig!),
                  ),
                ),
              ],
            )

        ],
      )
    );
  }
}