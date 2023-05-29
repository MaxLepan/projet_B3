import 'package:flutter/material.dart';
import 'package:projet_b3/Species/species_model.dart';
import 'package:projet_b3/Themes/colors.dart';

import '../Icons/custom_icons.dart';

class SpeciesViewBlockGenres extends StatelessWidget {
  final Species subject;
  final Color mainColor;
  const SpeciesViewBlockGenres({super.key, required this.subject, required this.mainColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const Text("Genres", style: titleStyle,),
          for(var entry in subject.imagesGenre!.entries)
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Stack(
                    alignment: Alignment.topLeft,
                    children: <Widget>[
                      Image.network(entry.value[0]),
                      Container(
                        alignment: Alignment.center,
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: mainColor,
                            borderRadius: BorderRadius.circular(3.0)
                        ),
                        child : Icon(entry.key == "female" ? CustomIcons.feminin : CustomIcons.masculin, color: black, size: 50,),

                      ),
                    ],
                  ),
                  Padding(padding: const EdgeInsets.only(top: 15),
                    child: Text(entry.value[1], style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 17),),
                  )

                ],
              ),
            )
        ],
      ),
    );
    
  }
}