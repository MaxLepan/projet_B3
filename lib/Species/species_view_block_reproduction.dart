import 'package:flutter/material.dart';
import 'package:projet_b3/Themes/colors.dart';

class SpeciesViewBlockReproduction extends StatelessWidget {
  final Map? content;
  final Color mainColor;
  final String title;
  final bool highlighted;


  const SpeciesViewBlockReproduction(
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
              margin: const EdgeInsets.only(top: 35, bottom: 16),
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
              padding: const EdgeInsets.only(top: 5, bottom: 15),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    for (String text in content!["texts"])
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '\u2022',
                            style: TextStyle(
                              fontSize: 17,
                              height: 1.55,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Container(
                              child: Text(
                                text,
                                textAlign: TextAlign.left,
                                softWrap: true,
                                style: textStyle
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
            if(content!["big_image"] != null)
              Container(
                margin: const EdgeInsets.only(top:15, bottom: 40),
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