import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet_b3/Icons/custom_icons.dart';
import 'package:projet_b3/Species/species_view_model.dart';
import 'package:projet_b3/Themes/app_bar.dart';
import 'package:projet_b3/Themes/colors.dart';
import '../Search/graph_tree_v2.dart';
import '../Species/species_model.dart';

class QuestionsResultChoiceView extends StatelessWidget {
  final Species subject;
  const QuestionsResultChoiceView(this.subject, {Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        appBar: const CustomAppBar(),
        body: Container(
          padding: horizontalPadding,
          margin: const EdgeInsets.only(top: 30),
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
                Padding(
                  padding: const EdgeInsets.only(top: 40,bottom: 60),
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      image: DecorationImage(
                        image: NetworkImage(subject.imageUrl ?? ""),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(child:
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/sheet', arguments: subject);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: greenBrown,
                              elevation: 0
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 25, bottom: 25),
                            child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 20),
                                  child: const Icon(CustomIcons.information02, size:50, color: black,),
                                ),
                                Text("Je veux davantage d'infos",
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
                            foregroundColor: green,
                            backgroundColor: white,
                            side: const BorderSide(color: greenBrown, width: 2.8),
                            elevation: 0,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 25, bottom: 25),
                            child: Flexible(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 20),
                                    child: const Icon(CustomIcons.cadrePhoto, size: 50, color: black),
                                  ),
                                  Flexible(
                                    child: Text(
                                      "Je veux ajouter ma photo sur la carte",
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
                const Spacer(),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                      },
                    ),
                  ],
                ),
              ]
          ),
        )
    );
  }
}
