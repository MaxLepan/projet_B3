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
      padding: EdgeInsets.symmetric(horizontal: 28, vertical: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: Text(title, style: titleStyle,),
          ),
          if(content!["tag"] != null)
            Container(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                margin: const EdgeInsets.only(bottom: 16),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.circular(3.0),
                ),
                child: Text(
                  content!["tag"],
                  style: smallTitle,
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(top: 5,),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (int i = 0; i < 2; i++)
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                              padding: const EdgeInsets.only(top: 16,),
                              child: Text(
                                content!["gallery"][i]["caption"],
                                style: textMediumStyle,
                                textAlign: TextAlign.center,
                              ),
                            ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),

          if(content!["big_image"] != null)
            Container(
              margin: const EdgeInsets.only(top:30),
              height: 150,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                image: DecorationImage(
                  image: NetworkImage(content!["big_image"]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
        ],
      )
    );
  }
}