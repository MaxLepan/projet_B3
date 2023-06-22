import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet_b3/Themes/custom_icons.dart';
import 'package:projet_b3/Themes/app_bar.dart';
import 'package:projet_b3/Themes/colors.dart';
import '../Species/species_model.dart';

class QuestionsResultChoiceView extends StatelessWidget {
  final Species subject;
  const QuestionsResultChoiceView(this.subject, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        appBar: const CustomAppBarCloseReturn(),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Column(
                  children: [
                    Container(
                      padding: horizontalPadding,
                      margin: const EdgeInsets.only(top: 30, bottom: 30),
                      child:
                      Column(
                          children: [
                            Text("RÉSULTAT", style: textStyle,),
                            Padding(
                              padding: const EdgeInsets.only(right: 16, left: 16, top: 14, bottom: 20),
                              child: Text(
                                'Que souhaites-tu faire ?',
                                textAlign: TextAlign.center,
                                style: titleStyle,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 40, bottom: 60),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: const Image(
                                  height: 300,
                                  image: AssetImage('assets/images/search_choice.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 17),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(child:
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context, '/sheet', arguments: subject);
                                      },
                                      style: ElevatedButton.styleFrom(
                                          foregroundColor: beige_04,
                                          shadowColor: Colors.transparent,
                                          backgroundColor: greenBrown,
                                          elevation: 0
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                                        child:
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(right: 20),
                                              child: const Icon(CustomIcons.info_01, size:30, color: black,),
                                            ),
                                            Text("Obtenir d'avantages d'infos",
                                              style: textBoldStyle,
                                            ),
                                          ],
                                        ),
                                      )
                                  ),
                                  )
                                ],
                              ),
                            ),

                            Row(
                              children:[
                                Expanded(
                                  child: ElevatedButton(
                                      onPressed: () {
                                      },
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: beige_04,
                                        shadowColor: Colors.transparent,
                                        backgroundColor: white,
                                        side: const BorderSide(color: greenBrown, width: 2.8),
                                        elevation: 0,
                                      ),
                                      child: Padding(
                                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                                          child: Flexible(
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  margin: const EdgeInsets.only(right: 20),
                                                  child: const Icon(CustomIcons.image_01, size: 30, color: black),
                                                ),
                                                Flexible(
                                                  child: Text(
                                                    "Ajouter ma photo sur la carte",
                                                    style: textBoldStyle,
                                                    softWrap: true,
                                                  ),

                                                )
                                              ],
                                            ),
                                          )
                                      )
                                  ),
                                ),
                              ],
                            ),
                          ]
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        )
    );
  }
}
