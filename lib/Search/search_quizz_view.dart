import 'package:flutter/material.dart';
import '../routes.dart';
import 'graph_tree_v2.dart';

class SearchQuizzView extends StatelessWidget {

  final String? questionKey;
  SearchQuizzView(this.questionKey);

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


List<ElevatedButton> generateButtons(BuildContext context, String? questionKey){

  List buttonsTitles = [];
  List<ElevatedButton> buttonsToDisplay = [];
  var nodes;

  if(questionKey == ""){
    buttonsTitles = graph.nodes.entries.first.value.toList();
  }

  else{
    nodes = graph.nodes.entries;
    buttonsTitles = graph.nodes.entries.firstWhere((entry) => entry.key.data == questionKey).value.toList();
  }

  print("***$questionKey");



  for(var title in buttonsTitles){
    buttonsToDisplay.add(
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/questions', arguments: title.data);
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
  runApp(MaterialApp(
    home: SearchQuizzView(""),
    routes: routes,
  ));
}

