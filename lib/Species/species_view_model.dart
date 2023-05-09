import 'package:firebase_core/firebase_core.dart';
import 'package:projet_b3/Species/species_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SpeciesViewModel {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> getSpecies() async {
    try {
      CollectionReference species = FirebaseFirestore.instance.collection('species');
      QuerySnapshot querySnapshot = await species.get();
      final data = querySnapshot.docs.map((species) => species.data()).toList();
      List<Species> speciesList = convertToSpeciesList(data);
      print("***DATA $data");
      speciesList.forEach((species) {
       print("*** $species");
      });
    } catch (error) {
      print('Error retrieving species: $error');
    }
  }

  List<Species> convertToSpeciesList(List objectList) {
    List<Species> speciesList = objectList.map((object) {
      String name = object['name'];
      String description = object['description'];
      String category = object['category'];
      String imageUrl = object['image'];
      String funFact = object['fun_fact'];
      String habitat = object['habitat'];
      String humanImpact = object['human_impact'];
      Timestamp lastView = object['last_view'];
      String observable = object['observable'];
      String protectionStatus = object['protection_status'];

      return Species(
          name: name,
          description: description,
          imageUrl: imageUrl,
          category: category,
          funFact: funFact,
          habitat: habitat,
          humanImpact: humanImpact,
          lastView: lastView,
          observable: observable,
          protectionStatus: protectionStatus
      );
    }).toList();
    return speciesList;
  }
}