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

      return convertToSpeciesList(querySnapshot);
    } catch (error) {
      print('Error retrieving species: $error');
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
      return convertToSpeciesList(querySnapshot);

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
        ContentThreePics? alimentation = await ContentThreePics.createContentThreePics("alimentation", speciesData);

        Species speciesObj = Species(
          name: speciesData!['name'],
          latinName: speciesData['latin_name'],
          category: speciesData['category'],
          shortProtectionStatus: speciesData['short_protection_status'],
          habitats: List<String>.from(speciesData["habitats"]),
          humanImpact: humanImpact,
          lastView: speciesData['last_view'],
          funFact1: funFact1,
          funFact2: funFact2,
          imageUrl: speciesData['image'],
          contentGenres: contentGenre,
          reproduction: reproduction,
          alert: alert,
          alimentation: alimentation
        );

        return speciesObj;
      } else {
        throw Exception('Species not found');
      }
  }

  Future<List<Species>> convertToSpeciesList(QuerySnapshot<Object?> querySnapshot) async {
    final data = querySnapshot.docs.map((species) => species.data()).toList();
    List<Species> speciesList = [];

    for (var speciesData in data) {
      Map<String, dynamic> speciesDataMap = speciesData as Map<String, dynamic>;

      SimpleContent? funFact1 = speciesDataMap['fun_fact1'] == null ? null : await SimpleContent.createContentSimple("fun_fact1", speciesDataMap);
      SimpleContent? funFact2 = speciesDataMap['fun_fact2'] == null ? null : await SimpleContent.createContentSimple("fun_fact2", speciesDataMap);
      SimpleContent? humanImpact = speciesDataMap['human_impact'] == null ? null : await SimpleContent.createContentSimple("human_impact", speciesDataMap);
      SimpleContent? alert = speciesDataMap['alert'] == null ? null : await SimpleContent.createContentSimple("alert", speciesDataMap);

      ContentGenres? contentGenre = speciesDataMap['content_genres'] == null ? null : await ContentGenres.createContentGenres("content_genres", speciesDataMap);

      ContentThreePics? reproduction = speciesDataMap['reproduction'] == null ? null : await ContentThreePics.createContentThreePics("reproduction", speciesDataMap);
      ContentThreePics? alimentation = speciesDataMap['alimentation'] == null ? null : await ContentThreePics.createContentThreePics("alimentation", speciesDataMap);

      Species speciesObj = Species(
        name: speciesDataMap['name'],
        latinName: speciesDataMap['latin_name'],
        category: speciesDataMap['category'],
        shortProtectionStatus: speciesDataMap['short_protection_status'],
        habitats: List<String>.from(speciesDataMap["habitats"]),
        humanImpact: humanImpact,
        lastView: speciesDataMap['last_view'],
        funFact1: funFact1,
        funFact2: funFact2,
        imageUrl: speciesDataMap['image'],
        contentGenres: contentGenre,
        reproduction: reproduction,
        alert: alert,
        alimentation: alimentation,
      );

      speciesList.add(speciesObj);
    }

    return speciesList;
  }
}