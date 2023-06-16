import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../Species/species_model.dart';

class MarkerViewModel {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late Position currentPosition;
  final FirebaseFirestore fireStoreDataBase = FirebaseFirestore.instance;

  Future<String> uploadImage(File file) async {
    await Firebase.initializeApp();
    final firebaseStorage = FirebaseStorage.instance;

    var snapshot = await firebaseStorage
        .ref()
        .child('images/markers/${DateTime.now().toString()}')
        .putFile(file);
    var downloadUrl = await snapshot.ref.getDownloadURL();

    return downloadUrl;
  }

  Future<void> addMarkerToDb(String imageUrl, Species species) async {
    await getCurrentPosition();
    fireStoreDataBase.collection('marker').add({
      'creationDate': DateTime.now(),
      'location': GeoPoint(currentPosition.latitude, currentPosition.longitude),
      'image': imageUrl,
      'species': {
        'category': species.category,
        'name': species.name,
      },
      'userId': "thatOneUser"
    });
  }

  Future<void> getCurrentPosition() async {
    var position = await Geolocator.getCurrentPosition();
    currentPosition = position;
  }
}