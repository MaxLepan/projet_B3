import 'dart:developer';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet_b3/Tree/graph_tree.dart';
import 'package:projet_b3/Themes/custom_icons.dart';
import 'package:projet_b3/Species/species_view_model.dart';
import 'package:projet_b3/Themes/app_bar.dart';
import 'package:projet_b3/Themes/colors.dart';
import 'package:projet_b3/Tree/node.dart';
import '../Species/species_model.dart';

class QuestionManyResultsView extends StatelessWidget {
  final List<Node> results;
  const QuestionManyResultsView(this.results, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> speciesNameList = [];
    for (var result in results) {
      speciesNameList.add(result.data);
    }

    var test = SpeciesViewModel().getSpeciesFromList(speciesNameList);

    return FutureBuilder<List<Species>>(
      future: SpeciesViewModel().getSpeciesFromList(speciesNameList),
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
            'Une erreur s\'est produite lors du chargement des données.',
          );
        } else {
          List<Species>? speciesList = snapshot.data;

          return Scaffold(
            appBar: const CustomAppBarCloseReturn(),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 30),
                child: Column(
                children: [
                  Text("RÉSULTAT", style: textStyle),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 55),
                    padding: const EdgeInsets.only(bottom: 30, top: 20),
                    child: Text(
                      "Voici ce que tu pourrais voir autour de toi",
                      style: titleStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: speciesList!.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      childAspectRatio: 0.95,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    itemBuilder: (BuildContext context, int index) {
                      Species species = speciesList[index];
                      Color borderColor;

                      if (species.category.toLowerCase() == "reptile") {
                        borderColor = purple_02;
                      } else if (species.category.toLowerCase() == "amphibien") {
                        borderColor = mint_02;
                      } else if (species.category.toLowerCase() == "insecte") {
                        borderColor = orange_02;
                      } else {
                        borderColor = strawberry_02;
                      }

                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/sheet', arguments: species);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: borderColor,
                              width: 4,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            color: darkBeige,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ExtendedImage.network(
                                species.imageUrl!,
                                height: 120,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                cache: true,
                                loadStateChanged: (ExtendedImageState state) {
                                  switch (state.extendedImageLoadState) {
                                    case LoadState.loading:
                                      return Container(
                                        color: Colors.grey,
                                      );
                                    case LoadState.completed:
                                      return null;
                                    case LoadState.failed:
                                      return Container(
                                        color: Colors.redAccent,
                                      );
                                  }
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 3),
                                child: Text(
                                  "${species.name[0].toUpperCase()}${species.name.substring(1).toLowerCase()}",
                                  style: smallTitle,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),)
            ),
          );

        }
      },
    );
  }
}
