

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet_b3/Themes/unseen_icons.dart';

import 'colors.dart';

Widget bubbleText(Color color, String text){
  return Container(
    margin: const EdgeInsets.only(right: 14, bottom: 14),
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(3.0),
    ),
    child: Text(
      text,
      style: smallTitle,
    ),
  );
}

Widget iconBlock(String title, String description, Color cardBgColor, Widget icon){
  return
    Container(
      padding: const EdgeInsets.only(left: 16, right: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: cardBgColor
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 16),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child:Row(
                      children:[
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: icon,
                        ),
                        if(title != null)
                          Expanded(child: Text(title, style: smallTitle,),)
                      ]
                  ),
                ),
                if(description != null)
                  Text(description, style: textStyle,),
              ],
            )
          ),
        ],
      ),
    );
}

Widget blockLegend(Color color, String boldText, String regularText, Color lineColor){
  return Container(
    margin: const EdgeInsets.only(bottom: 10),
    decoration: const BoxDecoration(
        color: darkBeige,
        borderRadius: BorderRadius.all(Radius.circular(5))
    ),
    child: Row(
      children: [
        Container(
          width: 38,
          height: 38,
          margin: const EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(5), bottomLeft: Radius.circular(5))
          ),
          child: Transform.rotate(
            angle: 45 * pi / 180,
            child: Divider(
              color: lineColor,
              thickness: 2,
              indent: 2,
              endIndent: 2,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 8, bottom: 8, top: 8),
          child: Text(boldText, style: textBoldStyle),
        ),
        Container(
          padding: const EdgeInsets.only(right: 8, top: 8, bottom: 8),
          child: Text(regularText, style: textStyle),
        )
      ],
    ),
  );
}