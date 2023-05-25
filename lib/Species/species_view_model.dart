import 'package:firebase_core/firebase_core.dart';
import 'package:projet_b3/Species/species_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:slugify/slugify.dart';

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


  Future<Species> getSpeciesByName(String name) async {
      CollectionReference species = FirebaseFirestore.instance.collection('species');
      QuerySnapshot querySnapshot = await species.where('name', isEqualTo: name).limit(1).get();
      final data = querySnapshot.docs.map((species) => species.data()).toList();

      if (data.isNotEmpty) {
        Map<String, dynamic>? speciesData = data.first as Map<String, dynamic>?;
        Species speciesObj = Species(
          name: speciesData!['name'],
          latinName: speciesData!['latin_name'],
          description: speciesData['description'],
          category: speciesData['category'],
          shortProtectionStatus: speciesData['short_protection_status'],
          protectionStatus: speciesData['protection_status'],
          habitat: speciesData['habitat'],
          humanImpact: speciesData['human_mpact'],
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
      String name = object['name'];
      String latinName = object['latin_name'];
      String description = object['description'];
      String category = object['category'];
      String imageUrl = object['image'];
      String funFact = object['fun_fact'];
      String habitat = object['habitat'];
      String humanImpact = object['human_impact'];
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
          funFact: funFact,
          habitat: habitat,
          humanImpact: humanImpact,
          lastView: lastView,
          observable: observable,
          protectionStatus: protectionStatus,
          shortProtectionStatus: shortProtectionStatus
      );
    }).toList();
    return speciesList;
  }
}