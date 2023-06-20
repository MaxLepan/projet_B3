import 'package:flutter/material.dart';
import 'package:projet_b3/Themes/colors.dart';

import '../Themes/custom_icons.dart';

class SpeciesViewBlockGenres extends StatelessWidget {
  final Map? content;
  final Color mainColor;
  final bool highlighted;
  const SpeciesViewBlockGenres({super.key, required this.content, required this.mainColor, required this.highlighted});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: highlighted == false ? white : darkBeige,
      margin: const EdgeInsets.only(top: 35, bottom: 35),
      padding: horizontalPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text("Genre", style: titleStyle,),
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
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: imageWithPlaceholder(gender.value["image_url"], 170),
                          ),
                        if(gender.key != "male_female")
                          Container(
                            alignment: Alignment.center,
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                color: mainColor,
                                borderRadius: const BorderRadius.only(topLeft: Radius.circular(5.0), bottomRight: Radius.circular(5.0)),
                            ),
                            child : Icon(gender.key == "female" ? CustomIcons.woman_01 : CustomIcons.man_01, color: black, size: 35,),
                          ),
                        if(gender.key == "male_female")
                          Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 7),
                                alignment: Alignment.center,
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: mainColor,
                                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(5.0), bottomRight: Radius.circular(5.0)),
                                ),
                                child : const Icon(CustomIcons.man_01, color: black, size: 35,),
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: mainColor,
                                  borderRadius: const BorderRadius.only(topRight: Radius.circular(5.0), bottomRight: Radius.circular(5.0)),
                                ),
                                child : const Icon(CustomIcons.woman_01, color: black, size: 35,),

                              ),
                            ],
                          )
                      ],
                    ),
                  Padding(padding: const EdgeInsets.only(top: 10, bottom: 15),
                    child:
                      Text(gender.value["caption"], style: textItalicStyle,),
                  ),
                ],
              ),
            )
        ],
      ),
    );
    
  }
}