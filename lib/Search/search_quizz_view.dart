import 'package:flutter/material.dart';
import '../routes.dart';
import 'graph_tree_v2.dart';

class SearchQuizzView extends StatelessWidget {

  final int? questionKey;
  const SearchQuizzView(this.questionKey, {super.key});

  @override
  Widget build(BuildContext context) {
    final List<ElevatedButton> buttonsToDisplay = generateButtons(context, questionKey);

    return Scaffold(
      appBar: AppBar(
        title: Text('Search Quizz'), // Titre de la page
      ),
      body: Container(
      color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: ListView.builder(
                itemCount: buttonsToDisplay.length,
                itemBuilder: (context, index) => buttonsToDisplay[index],
              ),
            ),
          ),
        ],
      ),
    ),
    );
  }
}


List<ElevatedButton> generateButtons(BuildContext context, int? nodeId){

  List buttonsTitles = [];
  List<ElevatedButton> buttonsToDisplay = [];


  if(nodeId == null){
    buttonsTitles = graph.nodes.entries.first.value.toList();
  }

  else{
    buttonsTitles = graph.nodes.entries.firstWhere((entry) => entry.key.id == nodeId).value.toList();
  }


  for(var button in buttonsTitles){
    buttonsToDisplay.add(
        ElevatedButton(
          onPressed: () {
            if(button.questionKey != null){
              Navigator.pushNamed(context, '/questions', arguments: button.id);
            }
            else{
              Navigator.pushNamed(context, '/questions/result', arguments: button);
            }
          },
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(200, 50),
          ),
          child: Text(
            button.data,
            style: const TextStyle(fontSize: 24),
          ),
        ),
    );
  }
  return buttonsToDisplay;
}

void main() {
  runApp(MaterialApp(
    home: SearchQuizzView(null),
    routes: routes,
  ));
}

