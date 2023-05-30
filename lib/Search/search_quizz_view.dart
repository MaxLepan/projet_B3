import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../Questions/questions_model.dart';
import '../Questions/questions_view_model.dart';
import '../firebase_options.dart';
import '../routes.dart';
import 'graph_tree_v2.dart';

class SearchQuizzView extends StatelessWidget {

  final Node? node;
  const SearchQuizzView(this.node, {super.key});

  @override
  Widget build(BuildContext context) {

    final List<ElevatedButton> buttonsToDisplay = generateButtons(context, node);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Quizz'), // Titre de la page
      ),
      body: Container(
        child: FutureBuilder<List<Question>?>(
          future: QuestionsViewModel().getQuestionByKey(node?.questionKey),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Erreur de chargement des questions'));
            } else {
              final Question? question = snapshot.data?.first;

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(question?.question ?? 'Erreur lors du chargement de la question',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      )),
                  Expanded(
                    child: Center(
                      child: ListView.builder(
                        itemCount: buttonsToDisplay.length,
                        itemBuilder: (context, index) => buttonsToDisplay[index],
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}


List<ElevatedButton> generateButtons(BuildContext context, Node? node){

  List buttonsTitles = [];
  List<ElevatedButton> buttonsToDisplay = [];

  if(node == null){
    buttonsTitles = graph.nodes.entries.first.value.toList();
  }

  else{
    buttonsTitles = graph.nodes.entries.firstWhere((entry) => entry.key == node).value.toList();
  }

  for(var button in buttonsTitles){
    buttonsToDisplay.add(
        ElevatedButton(
          onPressed: () {
            if(button.questionKey != null){
              Navigator.pushNamed(context, '/questions', arguments: button);
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

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MaterialApp(
    home: const SearchQuizzView(null),
    routes: routes,
  ));
}

