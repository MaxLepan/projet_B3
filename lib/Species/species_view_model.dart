import 'package:firebase_core/firebase_core.dart';
import 'package:projet_b3/Species/species_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:slugify/slugify.dart';

import '../Fun_facts/fun_facts_model.dart';

class SpeciesViewModel {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> getSpecies() async {
    try {
      CollectionReference species = FirebaseFirestore.instance.collection('species');
      QuerySnapshot querySnapshot = await species.get();
      final data = querySnapshot.docs.map((species) => species.data()).toList();
      List<Species> speciesList = convertToSpeciesList(data);
    } catch (error) {
      print('Error retrieving species: $error');
    }
  }


  Future<Species> getSpeciesByName(String name) async {
      CollectionReference species = FirebaseFirestore.instance.collection('species');
      QuerySnapshot querySnapshot = await species.where('name', isEqualTo: name).limit(1).get();
      final data = querySnapshot.docs.map((species) => species.data()).toList();

      if (data.isNotEmpty) {
        Map<String, dynamic>? speciesData = data.first as Map<String, dynamic>?;

        FunFact? funFact1 = await createFunFact("fun_fact1", speciesData);
        FunFact? funFact2 = await createFunFact("fun_fact2", speciesData);

        Species speciesObj = Species(
          name: speciesData!['name'],
          latinName: speciesData['latin_name'],
          description: speciesData['description'],
          category: speciesData['category'],
          shortProtectionStatus: speciesData['short_protection_status'],
          protectionStatus: speciesData['protection_status'],
          habitats: List<String>.from(speciesData["habitats"]),
          humanImpact: List<String>.from(speciesData['human_impact']),
          lastView: speciesData['last_view'],
          observable: speciesData['observable'],
          funFact1: funFact1,
          funFact2: funFact2,
          imageUrl: speciesData['image'],
          imagesGenre: speciesData['images_genre'],
        );
        return speciesObj;
      } else {
        throw Exception('Species not found');
      }
  }

  Future<FunFact?> createFunFact(String funFactKey, Map<String, dynamic>? speciesData) async {
    DocumentReference<Map<String, dynamic>> funFactRef = speciesData![funFactKey];
    DocumentSnapshot<Map<String, dynamic>> funFactSnapshot = await funFactRef.get();

    FunFact? funFact;
    if (funFactSnapshot.exists) {
      Map<String, dynamic>? funFactData = funFactSnapshot.data();

      funFact = FunFact(
        funFactData?['title'],
        funFactData?['description'],
        funFactData?['text'],
        funFactData?['image_url'],
      );
    }

    return funFact;
  }

  List<Species> convertToSpeciesList(List objectList) {
    List<Species> speciesList = objectList.map((object) {
      String name = object['name'];
      String latinName = object['latin_name'];
      String description = object['description'];
      String category = object['category'];
      String imageUrl = object['image'];
      List<String> funFact1 = List<String>.from(object['fun_fact1']);
      List<String> funFact2 = List<String>.from(object['fun_fact2']);
      List<String> habitats = List<String>.from(object['habitats']);
      List<String> humanImpact = List<String>.from(object['human_impact']);
      Timestamp lastView = object['last_view'];
      String observable = object['observable'];
      String shortProtectionStatus = object['short_protection_status'];
      String protectionStatus = object['protection_status'];
      Map imageGenre = object['images_genre'];

      return Species(
          name: name,
          latinName: latinName,
          description: description,
          imageUrl: imageUrl,
          category: category,
          habitats: habitats,
          humanImpact: humanImpact,
          lastView: lastView,
          observable: observable,
          protectionStatus: protectionStatus,
          shortProtectionStatus: shortProtectionStatus,
          imagesGenre: imageGenre,
      );
    }).toList();
    return speciesList;
  }
}