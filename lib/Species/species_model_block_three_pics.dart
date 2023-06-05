import 'package:flutter/material.dart';
import 'package:projet_b3/Themes/colors.dart';

class SpeciesViewBlockThreePics extends StatelessWidget {
  final Map? content;
  final Color mainColor;
  final String title;
  final bool highlighted;


  const SpeciesViewBlockThreePics(
      {super.key, required this.content, required this.mainColor, required this.title, required this.highlighted});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: highlighted == false ? white : darkBeige,
      padding: horizontalPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 16),
            child: Text(title, style: titleStyle,),
          ),
          if(content!["tag"] != null)
            Container(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                margin: const EdgeInsets.only(right: 8, bottom: 8),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.circular(3.0),
                ),
                child: Text(
                  content!["tag"],
                  style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                for (int i = 0; i < 3; i++)
                  Expanded(
                    child: Column(
                      children: [
                        if (content != null && content!["gallery"] != null && content!["gallery"][i]["image_url"] != null)
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(content!["gallery"][i]["image_url"]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        if (content != null && content!["gallery"] != null && content!["gallery"][i]["caption"] != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              content!["gallery"][i]["caption"],
                              style: const TextStyle(fontSize: 18, color: black),
                              textAlign: TextAlign.center,
                            ),
                          ),
                      ],
                    ),
                  ),
              ],
            ),
          ),

          if(content!["big_image"] != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FractionallySizedBox(
                  widthFactor: 1.0,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Image.network(content!["big_image"]),
                  ),
                ),
              ],
            )
        ],
      )
    );
  }
}