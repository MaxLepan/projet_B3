import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet_b3/Species/species_model.dart';
import 'package:projet_b3/Themes/colors.dart';

import '../Themes/components.dart';

class SpeciesViewBlockHabitats extends StatelessWidget {
  final Species subject;
  final Color mainColor;
  final bool highlighted;
  const SpeciesViewBlockHabitats({super.key, required this.subject, required this.mainColor, required this.highlighted});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: highlighted == false ? white : darkBeige,
      child:
        Container(
          margin: const EdgeInsets.only(left: 28, right: 28),
          padding: const EdgeInsets.only(top: 35, bottom: 35),
          child: Column(
            children: <Widget> [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Habitat",
                    style: titleStyle,
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    children: [
                      for (var item in subject.habitats!)
                        bubbleText(mainColor, item),
                    ],
                  ),
                ],
              ),
            ],
          )
        )
    );
  }
}
