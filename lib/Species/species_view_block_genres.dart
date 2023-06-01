import 'package:flutter/material.dart';
import 'package:projet_b3/Content_genres/content_genres_model.dart';
import 'package:projet_b3/Species/species_model.dart';
import 'package:projet_b3/Themes/colors.dart';

import '../Icons/custom_icons.dart';

class SpeciesViewBlockGenres extends StatelessWidget {
  final ContentGenres content;
  final Color mainColor;
  const SpeciesViewBlockGenres({super.key, required this.content, required this.mainColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const Text("Genres", style: titleStyle,),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Stack(
                    alignment: Alignment.topLeft,
                    children: <Widget>[
                      if(content.imageUrlMale != null)
                        Image.network(content.imageUrlMale!),
                      Container(
                        alignment: Alignment.center,
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: mainColor,
                            borderRadius: BorderRadius.circular(3.0)
                        ),
                        child : const Icon(CustomIcons.masculin, color: black, size: 50,),

                      ),
                    ],
                  ),
                  Padding(padding: const EdgeInsets.only(top: 15, bottom: 15),
                    child:
                      Text(content.descriptionMale ?? "", style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 17),),
                  ),

                  Stack(
                    alignment: Alignment.topLeft,
                    children: <Widget>[
                      if(content.imageUrlFemale != null)
                        Image.network(content.imageUrlFemale!),
                      Container(
                        alignment: Alignment.center,
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: mainColor,
                            borderRadius: BorderRadius.circular(3.0)
                        ),
                        child : const Icon(CustomIcons.feminin, color: black, size: 50,),

                      ),
                    ],
                  ),
                  Padding(padding: const EdgeInsets.only(top: 15),
                    child:
                    Text(content.descriptionFemale ?? "", style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 17),),
                  ),
                ],
              ),
            )
        ],
      ),
    );
    
  }
}