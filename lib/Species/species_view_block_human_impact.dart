import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet_b3/Species/species_model.dart';
import 'package:projet_b3/Themes/colors.dart';

import '../Content_simple/content_simple_model.dart';

class SpeciesViewBlockHumanImpact extends StatelessWidget {
  final SimpleContent humanImpact;
  final Color mainColor;
  const SpeciesViewBlockHumanImpact({super.key, required this.humanImpact, required this.mainColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: horizontalPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(humanImpact.title != null)
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 6),
              child: Text(humanImpact.title!, style: titleStyle,),
            ),

          if(humanImpact.text != null)
            Padding(
              padding: const EdgeInsets.only(top: 6, bottom: 12),
              child: Text(humanImpact.text!, style: textStyle),
            ),
        ],
      )
    );
  }
}