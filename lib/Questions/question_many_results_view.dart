import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet_b3/Species/species_view_model.dart';
import 'package:projet_b3/Themes/app_bar.dart';
import 'package:projet_b3/Themes/colors.dart';
import 'package:projet_b3/Tree/node.dart';
import '../Species/species_model.dart';
import '../Tree/node_view_model.dart';

class QuestionManyResultsView extends StatelessWidget {
  final List<Node> results;
  const QuestionManyResultsView(this.results, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Species>>(
      future: _getSpeciesList(),
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

        } else if (!snapshot.hasData){
          return Scaffold(
              appBar: const CustomAppBarCloseReturn(),
              body: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 60),
                child: Text(
                  'Aucune espèce de petites bêtes n\'est visible autour de toi à cette'
                      ' période de l\'année.', style: titleStyle, textAlign: TextAlign.center,),
              )
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
                padding: const EdgeInsets.symmetric(vertical: 30),
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
                              ClipRRect(
                                borderRadius: const BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                                child: imageWithPlaceholder(species.imageUrl!, 110),
                              ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 3, bottom: 5),
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
                ),
              ),
            ),
          );
        }
      },
    );
  }

  Future<String> _getSpeciesName(result) async {
    var speciesData = await NodeViewModel().getNode(result.id, "habitats");
    var speciesName = speciesData!["data"];
    return speciesName;
  }

  Future<List<Species>> _getSpeciesList() async {
    List<String> speciesNameList = [];
    for (var result in results) {
      var speciesName = await _getSpeciesName(result);
      speciesNameList.add(speciesName);
    }
    return SpeciesViewModel().getSpeciesFromList(speciesNameList);
  }
}
