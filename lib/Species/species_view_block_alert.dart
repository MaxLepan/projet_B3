import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet_b3/Species/species_model.dart';
import 'package:projet_b3/Themes/colors.dart';

import '../Content_simple/content_simple_model.dart';
import '../Icons/custom_icons.dart';

class SpeciesViewBlocAlert extends StatelessWidget {
  final SimpleContent alert;
  final Color mainColor;
  const SpeciesViewBlocAlert({super.key, required this.alert, required this.mainColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: darkBeige,
      child: Container(
          padding: horizontalPadding,
          margin: const EdgeInsets.only(top: 25, bottom: 25),
          child: Container(
            color: white,
            padding: horizontalPadding,
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if(alert.title != null)
                  Row(
                    children: [
                      const Icon(CustomIcons.cloche_03, color: black, size: 30,),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 6),
                        child: Text(alert.title!, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                      ),
                    ],
                  ),

                if(alert.text != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 6, bottom: 12),
                    child: Text(alert.text!, style: textStyle),
                  ),
              ],
            ),
          )
      )
    );
  }
}