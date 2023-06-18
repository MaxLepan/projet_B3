import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet_b3/Themes/colors.dart';

class SpeciesViewBlockHumanImpact extends StatelessWidget {
  final Map? humanImpact;
  final Color mainColor;
  final bool highlighted;
  const SpeciesViewBlockHumanImpact({super.key, required this.humanImpact, required this.mainColor, required this.highlighted});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 35, bottom: 35),
      padding: horizontalPadding,
      color: highlighted == false ? white : darkBeige,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(humanImpact!["title"] != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(humanImpact!["title"], style: titleStyle,),
            ),

          if(humanImpact!["text"] != null)
            Padding(
              padding: const EdgeInsets.only(top: 6, bottom: 12),
              child: Text(humanImpact!["text"], style: textStyle),
            ),
        ],
      )
    );
  }
}