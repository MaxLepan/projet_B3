import 'package:firebase_core/firebase_core.dart';
import 'package:projet_b3/Species/species_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SpeciesViewModel {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<Species> speciesList = [];

  Future<void> getSpecies() async {
    try {
      CollectionReference species = FirebaseFirestore.instance.collection('species');
      final response = await species;
      QuerySnapshot querySnapshot = await species.get();
      final data = querySnapshot.docs.map((species) => species.data()).toList();
      print("*** $data");
      /*
      speciesList = data.entries
          .map((entry) => Species(
        id: entry.key,
        name: entry.value['name'],
        description: entry.value['description'],
        imageUrl: entry.value['image'],
      ))
          .toList();*/
    } catch (error) {
      print('Error retrieving species: $error');
    }
  }
}