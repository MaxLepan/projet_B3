import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Search/graph_tree_v2.dart';

class QuestionsResultView extends StatelessWidget {
  final Object? button;
  const QuestionsResultView(this.button, {super.key});

  @override
  Widget build(BuildContext context) {
    var theSpecies = graph.nodes.entries.firstWhere((entry) => entry.key == button ).value;

    return Scaffold(
      appBar: AppBar(
        title: Text(theSpecies.first.data),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'L\'espèce que vous observez est probablement un ${theSpecies.first.data}, cliquez sur le bouton pour voir sa fiche',
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
              child:
                Text('Voir la fiche')
            ),
          ],
        ),
      ),
    );
  }
}
