import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projet_b3/Questions/questions_model.dart';

class NodeViewModel {

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<Map<String, dynamic>?> getNode(String? nodeId, String? quizType) async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('nodes').doc(nodeId).get();

    if(nodeId == null && quizType == "species") {
      nodeId = "node_species";
    }

    if(nodeId == null && quizType == "environment") {
      nodeId = "node_environment";
    }

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('node')
        .where('id', isEqualTo: nodeId)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      DocumentSnapshot snapshot = querySnapshot.docs[0];
      Map<String, dynamic> data = snapshot.data()! as Map<String, dynamic>;

      return data;
    }
  }
}