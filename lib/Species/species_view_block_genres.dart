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
    print("***${subject.imagesGenre?.entries}");
    print("***${subject.imagesGenre?.entries}");

    return Padding(
      padding: EdgeInsets.all(16), 
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const Text("Genres", style: TextStyle(color: black, fontSize: 21, fontWeight: FontWeight.bold),),
          for(var entry in subject.imagesGenre!.entries)
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Stack(
                    alignment: Alignment.topLeft,
                    children: <Widget>[
                      Image.network(entry.value[0]),
                      Container(
                        alignment: Alignment.center,
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                            color: mainColor,
                            borderRadius: BorderRadius.circular(2.0)
                        ),
                        child : Icon(entry.key == "female" ? CustomIcons.feminin : CustomIcons.masculin, color: black, size: 38,),

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