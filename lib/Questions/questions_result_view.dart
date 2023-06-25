import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet_b3/Tree/graph_tree.dart';
import 'package:projet_b3/Themes/custom_icons.dart';
import 'package:projet_b3/Species/species_view_model.dart';
import 'package:projet_b3/Themes/app_bar.dart';
import 'package:projet_b3/Themes/colors.dart';
import 'package:projet_b3/Tree/node_view_model.dart';
import '../Species/species_model.dart';

class QuestionsResultView extends StatelessWidget {
  final Object? button;
  const QuestionsResultView(this.button, {super.key});

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<Species>(
      future: _getSpeciesData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            color: greenBrown,
            child: const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(black),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return const Text(
              'Une erreur s\'est produite lors du chargement des données.');
        } else {
          Species species = snapshot.data!;

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
                          child: Column(
                              children: [
                                Text("RÉSULTAT", style: textStyle,),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 16, left: 16, top: 14, bottom: 20),
                                  child: Text(
                                    'C\'est probablement un(e) ${species.name[0].toUpperCase()}${species.name.substring(1).toLowerCase()} !',
                                    textAlign: TextAlign.center,
                                    style: titleStyle,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(top: 40, bottom: 60),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: imageWithPlaceholder(species.imageUrl!, 300),
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
                                            Navigator.pushNamed(
                                                context, '/questions/result/choice',
                                                arguments: species);
                                          },
                                          style: ElevatedButton.styleFrom(
                                              foregroundColor: beige_04,
                                              shadowColor: Colors.transparent,
                                              backgroundColor: greenBrown,
                                              elevation: 0
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10, bottom: 10),
                                            child:
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      right: 20),
                                                  child: const Icon(
                                                    CustomIcons.check_01, size: 30,
                                                    color: black,),
                                                ),
                                                Text("C'est bien ca !",
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
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.pushReplacementNamed(context, '/questions', arguments: {'node': null, 'tree': graph_tree, 'quizType': "species"},);
                                          },
                                          style: ElevatedButton.styleFrom(
                                            foregroundColor: beige_04,
                                            shadowColor: Colors.transparent,
                                            backgroundColor: white,
                                            side: const BorderSide(
                                                color: greenBrown, width: 2.8),
                                            elevation: 0,
                                          ),
                                          child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10, bottom: 10),
                                              child: Flexible(
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment
                                                      .start,
                                                  children: [
                                                    Container(
                                                      margin: const EdgeInsets.only(
                                                          right: 20),
                                                      child: const Icon(
                                                          CustomIcons.cross_01, size: 30,
                                                          color: black),
                                                    ),
                                                    Flexible(
                                                      child: Text(
                                                        "J'ai un gros doute",
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
            ),
          );
        }
      }
    );
  }

  Future<Species> _getSpeciesData() async {
    var speciesNode = graph_tree.nodes.entries.firstWhere((entry) => entry.key == button).value;
    var speciesData = await NodeViewModel().getNode(speciesNode.first.id, "species");
    var speciesName = speciesData!["data"];
    return SpeciesViewModel().getSpeciesByName(speciesName);
  }
}


