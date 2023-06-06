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
                        'C\'est probablement un(e) ${speciesName.first.data.toString()[0].toUpperCase()}${speciesName.first.data.toString().substring(1).toLowerCase()} !',
                        textAlign: TextAlign.center,
                        style: titleStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 60),
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          image: DecorationImage(
                            image: NetworkImage(species.imageUrl ?? ""),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
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
                              child: Padding(
                                padding: const EdgeInsets.all(13),
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
                              side: const BorderSide(color: greenBrown, width: 2.8),
                              elevation: 0,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(13),
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
