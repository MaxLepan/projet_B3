import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet_b3/Species/species_model.dart';
import 'package:projet_b3/Themes/colors.dart';

class SpeciesViewBlockHumanImpact extends StatelessWidget {
  final List<String> humanImpact;
  final Color mainColor;
  const SpeciesViewBlockHumanImpact({super.key, required this.humanImpact, required this.mainColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: horizontalPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(humanImpact[0] != "")
            Text(humanImpact[0], style: titleStyle,),
          Row(
            children: [
              SizedBox(
                width: 70,
                height: 70,
                child: Image.network(
                  humanImpact[2],
                  fit: BoxFit.cover,
                ),
              ),
              Flexible(
                fit: FlexFit.loose,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    humanImpact[1],
                    style: textStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}