import 'package:projet_b3/Species/species_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


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

        Species speciesObj = Species(
          name: speciesData!['name'],
          latinName: speciesData['latin_name'],
          category: speciesData['category'],
          protectionStatus: speciesData['protection_status'],
          habitats: List<String>.from(speciesData["habitats"]),
          lastView: speciesData['last_view'],
          funFacts: speciesData['fun_facts'],
          humanImpacts: speciesData['human_impacts'],
          genders: speciesData['genders'],
          imageUrl: speciesData['image'],
          reproduction: speciesData['reproduction'],
          alerts: speciesData['alerts'],
          diet: speciesData['diet']
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

      Species speciesObj = Species(
        name: speciesDataMap['name'],
        latinName: speciesDataMap['latin_name'],
        category: speciesDataMap['category'],
        protectionStatus: speciesDataMap['protection_status'],
        habitats: List<String>.from(speciesDataMap["habitats"]),
        lastView: speciesDataMap['last_view'],
        imageUrl: speciesDataMap['image'],
      );

      speciesList.add(speciesObj);
    }
    return speciesList;
  }
}