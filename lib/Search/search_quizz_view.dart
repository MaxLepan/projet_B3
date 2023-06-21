import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projet_b3/Themes/app_bar.dart';
import 'package:projet_b3/Themes/colors.dart';
import '../Questions/questions_model.dart';
import '../Questions/questions_view_model.dart';
import '../Tree/node.dart';
import '../Tree/tree.dart';
import '../firebase_options.dart';
import '../routes.dart';
import '../Tree/graph_tree.dart';

class SearchQuizzView extends StatelessWidget {
  final Node? node;
  final Tree tree;
  final String? quizType;

  const SearchQuizzView(this.node, this.tree, {super.key, this.quizType});

  @override
  Widget build(BuildContext context) {

    final List<ElevatedButton> buttonsToDisplay = generateButtons(context, node, tree, quizType);

    return Scaffold(
      backgroundColor: white,
      appBar: const CustomAppBarCloseReturn(),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 40),
                  color: white,
                  child: FutureBuilder<List<Question>?>(
                    future: QuestionsViewModel().getQuestionByKey(node?.questionKey, quizType),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return const Center(child: Text('Erreur de chargement des questions'));
                      } else {
                        final Question? question = snapshot.data?.first;
                        return Column(
                          children: [
                            const Center(
                              child: Text("IDENTIFICATION"),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 58),
                              padding: const EdgeInsets.only(bottom: 30, top: 20),
                              child: Text(
                                question?.question ?? 'Erreur lors du chargement de la question',
                                style: const TextStyle(
                                  color: black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Center(
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: buttonsToDisplay.length,
                                itemBuilder: (context, index) => Container(
                                  padding: horizontalPadding,
                                  margin: const EdgeInsets.only(top: 20),
                                  child: buttonsToDisplay[index],
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: white,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: TextButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: Text(
                'Oups... Elle s’est enfuie.',
                style: textUnderlineStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


List<ElevatedButton> generateButtons(BuildContext context, Node? node, Tree tree, String? quizType){

  List buttonsTitles = [];
  List<ElevatedButton> buttonsToDisplay = [];

  if(node == null){
    buttonsTitles = tree.nodes.entries.first.value.toList();
  }

  else{
    buttonsTitles = tree.nodes.entries.firstWhere((entry) => entry.key == node).value.toList();
  }

  for(var button in buttonsTitles){
    buttonsToDisplay.add(
        ElevatedButton(
          onPressed: () {
            if(button.questionKey != null){
              Navigator.pushNamed(context, '/questions', arguments: { 'node': button, 'tree': tree, 'quizType': quizType},);
            }
            else{
              if(quizType == "species") {
                Navigator.pushNamed(context, '/questions/species_result', arguments: button);
              }else{
                var species_found = tree.nodes.entries.firstWhere((entry) => entry.key == button);
                Navigator.pushNamed(context, '/questions/environment_result', arguments: species_found.value);
              }
            }
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: beige_04,
            backgroundColor: white,
            shadowColor: Colors.transparent,
            side: const BorderSide(color: greenBrown, width: 2.8),
            elevation: 0,
            minimumSize: const Size(200, 50),
          ),
          child: Container(
            padding: const EdgeInsets.all(14),
            child:
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: greenBrown,
                    //image: DecorationImage(
                        //image: NetworkImage(button.image ?? "https://firebasestorage.googleapis.com/v0/b/appb3projet.appspot.com/o/images%2Fquizz%2F1200px-Question_mark_alternate.svg.png?alt=media&token=8bbe77c0-167d-4d95-84ad-49eead9c1af8"),
                      //  fit: BoxFit.cover
                    //),
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(child:
                  Text(
                    "${button.data.toString()[0].toUpperCase()}${button.data.toString().substring(1).toLowerCase()}",
                    style: textStyle,
                  ),
                )
              ],
            ),
          )
        ),
    );
  }
  return buttonsToDisplay;
}

