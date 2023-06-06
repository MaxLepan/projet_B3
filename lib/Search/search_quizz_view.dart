import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projet_b3/Themes/app_bar.dart';
import 'package:projet_b3/Themes/colors.dart';
import '../Questions/questions_model.dart';
import '../Questions/questions_view_model.dart';
import '../firebase_options.dart';
import '../routes.dart';
import 'graph_tree_v2.dart';

class SearchQuizzView extends StatelessWidget {
  final Node? node;
  const SearchQuizzView(this.node, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ElevatedButton> buttonsToDisplay = generateButtons(context, node);

    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 40),
                  color: white,
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
                          children: [
                            Center(
                              child: const Text("IDENTIFICATION"),
                            ),
                            Container(
                              padding: const EdgeInsets.only(bottom: 30),
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
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Row(
                      children: [
                        const Icon(Icons.arrow_back),
                        const SizedBox(width: 8),
                        Text(
                          'Retour',
                          style: textStyle,
                        ),
                      ],
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Action à effectuer lors du clic
                  },
                  child: const Text(
                    'Oups... Elle s’est enfuie.',
                    style: TextStyle(
                      color: black,
                      decoration: TextDecoration.underline,
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
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
            foregroundColor: black,
            backgroundColor: white,
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
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    image: DecorationImage(
                        image: NetworkImage(button.image ?? "https://firebasestorage.googleapis.com/v0/b/appb3projet.appspot.com/o/images%2Fquizz%2F1200px-Question_mark_alternate.svg.png?alt=media&token=8bbe77c0-167d-4d95-84ad-49eead9c1af8"),
                        fit: BoxFit.cover
                    ),
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

