import 'package:flutter/material.dart';
import 'graph_tree_v2.dart';

class SearchQuizzView extends StatelessWidget {
  List<ElevatedButton> buttonsToDisplay = generateButtons();

  SearchQuizzView(List<ElevatedButton> buttonToDisplay);

  @override
  Widget build(BuildContext context) {
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


List<ElevatedButton> generateButtons(){
  var buttonsTitles = graph.nodes.entries.first.value.toList();
  List<ElevatedButton> buttonsToDisplay = [];

  for(var title in buttonsTitles){
    buttonsToDisplay.add(
        ElevatedButton(
          onPressed: () {
          },
          child: Text(
            title.data,
            style: TextStyle(fontSize: 24),
          ),
          style: ElevatedButton.styleFrom(
            minimumSize: Size(200, 50),
          ),
        ),
    );
  }
  return buttonsToDisplay;
}

void main() {
  List<ElevatedButton> buttonToDisplay = [];

  runApp(MaterialApp(
    home: SearchQuizzView(buttonToDisplay), // Vue principale de l'application
  ));
}

