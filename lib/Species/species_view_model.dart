import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
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

  Future<List<Species>> getSpeciesFromList(List<String> speciesNames) async {
    final speciesCollection = FirebaseFirestore.instance.collection('species');
    var slicedSpeciesNames = [];
    List<Species> speciesList = [];

    if(speciesNames.length >= 10){
      for(int i = 0; i < speciesNames.length; i +=10){
        int endIndex = i + 10;
        slicedSpeciesNames.add(speciesNames.sublist(i, endIndex.clamp(0, speciesNames.length)));
      }

      for (var slicedNames in slicedSpeciesNames) {
        var querySnapshot =
        await speciesCollection.where('name', whereIn: slicedNames).get();
        List<Species> speciesListSlice = await convertToSpeciesList(querySnapshot);
        speciesList.addAll(speciesListSlice);
      }

      return speciesList;

    }else{
      final querySnapshot = await speciesCollection.where('name', whereIn: speciesNames).get();
      final speciesList = convertToSpeciesList(querySnapshot);
      return speciesList;
    }
  }

  Future<List<Species>> getSpeciesStartingBy(String name) async {
    try {
      name = name.toLowerCase();
      CollectionReference species = FirebaseFirestore.instance.collection('species');
      QuerySnapshot querySnapshot;
      if(name.isNotEmpty){
        if (name == 'el predator') {
          querySnapshot = await species.where('name', isEqualTo: 'alban perli').get();
        }
        else if (name == 'beau gosse') {
          querySnapshot = await species.where('name', isEqualTo: 'beau gosse').get();
        }
        else {
          querySnapshot = await species
              .where('name', isGreaterThanOrEqualTo: name)
              .where('name', isLessThan: '${name}z')
              .where('name', whereNotIn: ['alban perli', 'beau gosse'])
              .get();
        }
        return convertToSpeciesList(querySnapshot);
      }

      return [];

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
          diet: speciesData['diet'],
          length: speciesData['length'],
          precautions: speciesData['precautions'] != null ? List<String>.from(speciesData['precautions']) : null
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
        funFacts: speciesDataMap['fun_facts'],
        imageUrl: speciesDataMap['image'],
        humanImpacts: speciesDataMap['human_impacts'],
        genders: speciesDataMap['genders'],
        reproduction: speciesDataMap['reproduction'],
        alerts: speciesDataMap['alerts'],
        diet: speciesDataMap['diet'],
        length: speciesDataMap['length'],
        precautions: speciesDataMap['precautions'] != null ? List<String>.from(speciesDataMap['precautions']) : null
      );

      speciesList.add(speciesObj);
    }
    return speciesList;
  }

  Future<List<Map<String, dynamic>>> getUniqueAlertsByDate() async {
    CollectionReference species = FirebaseFirestore.instance.collection('species');
    QuerySnapshot querySnapshot = await species.get();

    Map<String, Map<String, dynamic>> uniqueAlerts = {};

    for (var doc in querySnapshot.docs) {
      Map<String, dynamic>? speciesData = doc.data() as Map<String, dynamic>?;

      if (speciesData != null && speciesData.containsKey('alerts')) {
        List<dynamic> alertsData = speciesData['alerts'] as List<dynamic>;

        for (var alertData in alertsData) {
          Map<String, dynamic>? alert = alertData as Map<String, dynamic>?;

          if (alert != null && alert.containsKey('key')) {
            String alertKey = alert['key'];

            if (!uniqueAlerts.containsKey(alertKey)) {
              uniqueAlerts[alertKey] = alert;
            } else {
              DateTime alertDate = (alert["date"] as Timestamp).toDate();
              DateTime existingAlertDate = (uniqueAlerts[alertKey]!['date'] as Timestamp).toDate();

              if (alertDate.isBefore(existingAlertDate)) {
                uniqueAlerts[alertKey] = alert;
              }
            }
          }
        }
      }
    }

    List<Map<String, dynamic>> sortedAlerts = uniqueAlerts.values.toList();

    sortedAlerts.sort((a, b) {
      DateTime aDate = (a["date"] as Timestamp).toDate();
      DateTime bDate = (b["date"] as Timestamp).toDate();
      return bDate.compareTo(aDate);
    });

    return sortedAlerts;
  }

}