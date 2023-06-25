import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projet_b3/Themes/app_bar.dart';
import 'package:projet_b3/Themes/colors.dart';
import 'package:projet_b3/Tree/node_view_model.dart';
import '../Questions/questions_model.dart';
import '../Questions/questions_view_model.dart';
import '../Tree/node.dart';
import '../Tree/tree.dart';

class SearchQuizzView extends StatelessWidget {
  final Node? node;
  final Tree tree;
  final String? quizType;

  const SearchQuizzView(this.node, this.tree, {Key? key, this.quizType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: const CustomAppBarCloseReturn(),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 20, bottom: 40),
                  color: white,
                  child: FutureBuilder<List<Question>?>(
                    future: NodeViewModel().getNode((node?.id != null ? node!.id : null), quizType).then((nodeData) {
                      var questionKey;
                      if(nodeData!=null) {
                        questionKey = nodeData["question_key"];
                      }
                      return QuestionsViewModel().getQuestionByKey(questionKey, quizType).then((value) => value ?? []);
                    }),
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
                              child: FutureBuilder<List<ElevatedButton>>(
                                future: generateButtons(context, node, tree, quizType),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState == ConnectionState.waiting) {
                                    return const CircularProgressIndicator();
                                  } else if (snapshot.hasError) {
                                    return const Text('Erreur de chargement des boutons');
                                  } else {
                                    return ListView.builder(
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemCount: snapshot.data?.length ?? 0,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          padding: horizontalPadding,
                                          margin: const EdgeInsets.only(top: 20),
                                          child: snapshot.data?[index],
                                        );
                                      },
                                    );
                                  }
                                },
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
          if(quizType != "environment")
            Container(
              color: white,
              padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 16),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/comming_soon', arguments: true );
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

Future<List<ElevatedButton>> generateButtons(BuildContext context, Node? node, Tree tree, String? quizType) async {
  List buttonsTitles = [];
  List<ElevatedButton> buttonsToDisplay = [];

  if (node == null) {
    buttonsTitles = tree.nodes.entries.first.value.toList();
  } else {
    buttonsTitles = tree.nodes.entries.firstWhere((entry) => entry.key == node).value.toList();
  }

  for (var button in buttonsTitles) {
    var buttonToDisplay = await NodeViewModel().getNode(button.id, quizType);
    buttonsToDisplay.add(
      ElevatedButton(
        onPressed: () {
          if (buttonToDisplay!["question_key"] != null) {
            Navigator.pushNamed(context, '/questions', arguments: {'node': button, 'tree': tree, 'quizType': quizType});
          } else {
            if (quizType == "species") {
              Navigator.pushNamed(context, '/questions/species_result', arguments: button);
            } else {
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
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: white,
                ),
                child: Image.network(buttonToDisplay!["image_url"]),
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Text(
                  "${buttonToDisplay["data"][0].toUpperCase()}${buttonToDisplay["data"].substring(1).toLowerCase()}",
                  style: textStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  return buttonsToDisplay;
}
