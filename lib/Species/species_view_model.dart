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

  Future<List<Species>> getSpeciesStartingBy(String name) async {
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
    } catch (error, stackTrace) {
      print('Error retrieving species starting by: $error');
      print(stackTrace);
      return [];
    }
  }

  Future<Species> getSpeciesByName(String name) async {
    CollectionReference species = FirebaseFirestore.instance.collection('species');
    QuerySnapshot querySnapshot = await species.where('name', isEqualTo: name).limit(1).get();
    final data = querySnapshot.docs.map((species) => species.data()).toList();

    if (data.isNotEmpty) {
      Map<String, dynamic>? speciesData = data.first as Map<String, dynamic>?;
      Species speciesObj = Species(
        name: speciesData!['name'],
        latinName: speciesData['latin_name'],
        description: speciesData['description'],
        category: speciesData['category'],
        shortProtectionStatus: speciesData['short_protection_status'],
        protectionStatus: speciesData['protection_status'],
        habitats: List<String>.from(speciesData["habitats"]),
        humanImpact: speciesData['human_impact'],
        lastView: speciesData['last_view'],
        observable: speciesData['observable'],
        funFact: speciesData['fun_fact'],
        imageUrl: speciesData['image'],
      );
      return speciesObj;
    } else {
      throw Exception('Species not found');
    }
  }

  List<Species> convertToSpeciesList(List objectList) {
    List<Species> speciesList = objectList.map((object) {
      //print('object : $object');
      print('object : ${object['name']}');

      String name = object['name'] ?? 'null';
      String latinName = object['latin_name'] ?? 'null';
      String description = object['description'] ?? 'null';
      String category = object['category'] ?? 'null';
      String imageUrl = object['image'] ?? 'null';
      String funFact = object['fun_fact'] ?? 'null';
      List<String> habitats = List<String>.from(object['habitats']) ?? [];
      List<String> humanImpact = List<String>.from(object['human_impact']) ?? [];
      Timestamp lastView = object['last_view'] ?? Timestamp.now();
      String observable = object['observable'] ?? 'null';
      String shortProtectionStatus = object['short_protection_status'] ?? 'null';
      String protectionStatus = object['protection_status'] ?? 'null';

      return Species(
          name: name,
          latinName: latinName,
          description: description,
          imageUrl: imageUrl,
          category: category,
          funFact: funFact,
          habitats: habitats,
          humanImpact: humanImpact,
          lastView: lastView,
          observable: observable,
          protectionStatus: protectionStatus,
          shortProtectionStatus: shortProtectionStatus
      );
    }).toList();

    print('speciesList : $speciesList');
    return speciesList;
  }
}