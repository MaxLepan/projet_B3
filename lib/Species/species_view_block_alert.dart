import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet_b3/Species/species_model.dart';
import 'package:projet_b3/Themes/colors.dart';

import '../Icons/custom_icons.dart';

class SpeciesViewBlocAlert extends StatelessWidget {
  final Map? alert;
  final Color mainColor;
  final bool highlighted;
  const SpeciesViewBlocAlert({super.key, required this.alert, required this.mainColor, required this.highlighted});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: highlighted == false ? white : darkBeige,
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
                if(alert?["title"] != null)
                  Row(
                    children: [
                      const Icon(CustomIcons.cloche_03, color: black, size: 30,),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 6),
                        child: Text(alert!["title"], style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                      ),
                    ],
                  ),

                if(alert?["description"] != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 6, bottom: 12),
                    child: Text(alert!["description"], style: textStyle),
                  ),
              ],
            ),
          )
      )
    );
  }
}