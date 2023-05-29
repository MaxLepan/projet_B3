import 'package:firebase_core/firebase_core.dart';
import 'package:projet_b3/Species/species_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SpeciesViewModel {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<Species> speciesList = [];

  Future<List<Species>> getSpecies() async {
    try {
      CollectionReference species = FirebaseFirestore.instance.collection('species');
      QuerySnapshot querySnapshot = await species.get();
      final data = querySnapshot.docs.map((species) => species.data()).toList();
      speciesList = convertToSpeciesList(data);
      return speciesList;
    } catch (error) {
      print('Error retrieving all species: $error');
      return [];
    }
  }

  Future<List<Species>> getSpeciesByName(String name) async {
    try {
      name = name.toLowerCase();
      CollectionReference species = FirebaseFirestore.instance.collection('species');
      QuerySnapshot querySnapshot = await species.where(
          'name',
          isGreaterThanOrEqualTo: name,
      ).where(
          'name',
          isLessThan: '${name}z'
      ).get();
      final data = querySnapshot.docs.map((species) => species.data()).toList();
      speciesList = convertToSpeciesList(data);
      return speciesList;
    } catch (error) {
      print('Error retrieving species by name: $error');
      return [];
    }
  }

  List<Species> convertToSpeciesList(List objectList) {
    List<Species> speciesList = objectList.map((object) {
      String name = object['name'] ?? 'null';
      String description = object['description'] ?? 'null';
      String category = object['category'] ?? 'null';
      String imageUrl = object['image'] ?? 'null';
      String funFact = object['fun_fact'] ?? 'null';
      String habitat = object['habitat'] ?? 'null';
      String humanImpact = object['human_impact'] ?? 'null';
      Timestamp lastView = object['last_view'] ?? Timestamp(0, 0);
      String observable = object['observable'] ?? 'null';
      String protectionStatus = object['protection_status'] ?? 'null';

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