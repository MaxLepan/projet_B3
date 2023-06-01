import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet_b3/Species/species_view_model.dart';
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
            appBar: AppBar(
              title: Text(speciesName.first.data),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'L\'espèce que vous observez est probablement un ${speciesName.first.data}, cliquez sur le bouton pour voir sa fiche',
                    textAlign: TextAlign.center,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/sheet', arguments: species);
                    },
                    child: const Text('Voir la fiche'),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
