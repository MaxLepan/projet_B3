import 'package:firebase_core/firebase_core.dart';
import 'package:projet_b3/Content_three_pics/content_three_pics.dart';
import 'package:projet_b3/Species/species_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../Content_genres/content_genres_model.dart';
import '../Content_simple/content_simple_model.dart';


class SpeciesViewModel {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<Species> speciesList = [];

  Future<List<Species>> getSpecies() async {
    try {
      CollectionReference species = FirebaseFirestore.instance.collection('species');
      QuerySnapshot querySnapshot = await species.get();
      final data = querySnapshot.docs.map((species) => species.data()).toList();
      List<Species> speciesList = convertToSpeciesList(data);
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

        SimpleContent? funFact1 = await SimpleContent.createContentSimple("fun_fact1", speciesData);
        SimpleContent? funFact2 = await SimpleContent.createContentSimple("fun_fact2", speciesData);
        SimpleContent? humanImpact = await SimpleContent.createContentSimple("human_impact", speciesData);
        SimpleContent? alert = await SimpleContent.createContentSimple("alert", speciesData);

        ContentGenres? contentGenre = await ContentGenres.createContentGenres("content_genres", speciesData);

        ContentThreePics? reproduction = await ContentThreePics.createContentThreePics("reproduction", speciesData);

        Species speciesObj = Species(
          name: speciesData!['name'],
          latinName: speciesData['latin_name'],
          description: speciesData['description'],
          category: speciesData['category'],
          shortProtectionStatus: speciesData['short_protection_status'],
          protectionStatus: speciesData['protection_status'],
          habitats: List<String>.from(speciesData["habitats"]),
          humanImpact: humanImpact,
          lastView: speciesData['last_view'],
          observable: speciesData['observable'],
          funFact1: funFact1,
          funFact2: funFact2,
          imageUrl: speciesData['image'],
          contentGenres: contentGenre,
          reproduction: reproduction,
          alert: alert
        );
        return speciesObj;
      } else {
        throw Exception('Species not found');
      }
  }

  List<Species> convertToSpeciesList(List objectList) {
    List<Species> speciesList = objectList.map((object) {
      String name = object['name'];
      String latinName = object['latin_name'];
      String description = object['description'];
      String category = object['category'];
      String imageUrl = object['image'];
      List<String> habitats = List<String>.from(object['habitats']);
      Timestamp lastView = object['last_view'];
      String observable = object['observable'];
      String shortProtectionStatus = object['short_protection_status'];
      String protectionStatus = object['protection_status'];

      return Species(
          name: name,
          latinName: latinName,
          description: description,
          imageUrl: imageUrl,
          category: category,
          habitats: habitats,
          lastView: lastView,
          observable: observable,
          protectionStatus: protectionStatus,
          shortProtectionStatus: shortProtectionStatus,
      );
    }).toList();
    return speciesList;
  }
}