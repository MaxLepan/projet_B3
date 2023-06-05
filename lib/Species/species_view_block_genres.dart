import 'package:flutter/material.dart';
import 'package:projet_b3/Themes/colors.dart';

import '../Icons/custom_icons.dart';

class SpeciesViewBlockGenres extends StatelessWidget {
  final Map? content;
  final Color mainColor;
  final bool highlighted;
  const SpeciesViewBlockGenres({super.key, required this.content, required this.mainColor, required this.highlighted});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: highlighted == false ? white : darkBeige,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const Text("Genres", style: titleStyle,),
            for(var gender in content!.entries)
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Stack(
                      alignment: Alignment.topLeft,
                      children: <Widget>[
                        if(content != null)
                          Container(
                            height: 170,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(gender.value["image_url"]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        Container(
                          alignment: Alignment.center,
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: mainColor,
                              borderRadius: BorderRadius.circular(3.0)
                          ),
                          child : Icon(gender.key == "female" ? CustomIcons.feminin : CustomIcons.masculin, color: black, size: 50,),

                        ),
                      ],
                    ),
                  Padding(padding: const EdgeInsets.only(top: 15),
                    child:
                      Text(gender.value["caption"], style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 17),),
                  ),
                ],
              ),
            )
        ],
      ),
    );
    
  }
}