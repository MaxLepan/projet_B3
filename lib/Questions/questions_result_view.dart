import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet_b3/Species/species_view_model.dart';
import 'package:projet_b3/Themes/app_bar.dart';
import 'package:projet_b3/Themes/colors.dart';
import '../Search/graph_tree_v2.dart';
import '../Species/species_model.dart';

class QuestionsResultView extends StatelessWidget {
  final Object? button;
  const QuestionsResultView(this.button, {super.key});

  @override
  Widget build(BuildContext context) {

    var speciesName = graph.nodes.entries.firstWhere((entry) => entry.key == button ).value;

    return FutureBuilder<Species>(
      future: SpeciesViewModel().getSpeciesByName(speciesName.first.data),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return const Text('Une erreur s\'est produite lors du chargement des données.');
        } else {
          Species species = snapshot.data!;

          return Scaffold(
            backgroundColor: white,
            appBar: CustomAppBar(),
            body: Container(
              padding: horizontalPadding,
              margin: EdgeInsets.only(top: 30),
              child:
                Column(
                  children: [
                    Text("RÉSULTAT"),
                    Padding(
                        padding: const EdgeInsets.only(right: 16, left: 16, top: 14, bottom: 20),
                      child: Text(
                        'C\'est probablement un ${speciesName.first.data} !',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: black, fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 60),
                      child:  Image.network(
                        species.imageUrl ?? "",
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          Expanded(child:
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/sheet', arguments: species);
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: greenBrown,
                                  elevation: 0
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(13),
                                child:
                                Text("Je veux d'avantages d'infos !",
                                  style: textStyle,
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
                              Navigator.pushReplacementNamed(context, '/sheet', arguments: species);
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: green,
                              backgroundColor: white,
                              side: BorderSide(color: greenBrown, width: 2.8),
                              elevation: 0,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(13),
                              child: Text(
                                "J'ai gros doute...",
                                style: textStyle,
                              ),
                            ) 
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: <Widget>[
                        IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () {
                          },
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        TextButton(
                          onPressed: () {
                          },
                          child: const Text(
                            'Ajouter sur la carte',
                            style: TextStyle(
                              color: Colors.black,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]
                ),
              )
            );
          }
       },
    );
  }
}
