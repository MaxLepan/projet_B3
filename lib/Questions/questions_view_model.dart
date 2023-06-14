import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projet_b3/Questions/questions_model.dart';

class QuestionsViewModel {

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<Question>?> getQuestions() async {
    try {
      CollectionReference question = FirebaseFirestore.instance.collection('questions');
      QuerySnapshot querySnapshot = await question.get();
      final data = querySnapshot.docs.map((question) => question.data()).toList();
      List<Question> questionsList = convertToQuestionsList(data);
      return questionsList;
    } catch (error) {
        return null;
    }
  }

  Future<List<Question>?> getQuestionByKey(String? key) async {
    try {
      key ??= "species";
      CollectionReference question = FirebaseFirestore.instance.collection('questions');
      QuerySnapshot querySnapshot = await question.where('key', isEqualTo: key).get();
      final data = querySnapshot.docs.map((species) => species.data()).toList();
      List<Question> questionsList = convertToQuestionsList(data);
      return questionsList;
    } catch (error) {
      return null;
    }
  }

  List<Question> convertToQuestionsList(List objectList) {
    List<Question> questionsList = objectList.map((object) {
      String key = object['key'];
      String question = object['question'];

      return Question(key, question);
    }).toList();
    return questionsList;
  }

}