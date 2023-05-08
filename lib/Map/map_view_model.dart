import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart' as latLng;

class MapViewModel {

  late Position currentPosition;
  final mapController = MapController();

  MapViewModel(){
    positionAtInit();
  }

  Future<void> positionAtInit() async {
    Geolocator.getCurrentPosition().then((position) {
      mapController.move(
          latLng.LatLng(position.latitude, position.longitude), 15.0);
      currentPosition = position;
    });
  }

  void getCurrentPosition(){
    Geolocator.getCurrentPosition().then((position) {
      currentPosition = position;
    });
  }

  Future<List> uploadImage(File file, String description) async {
    await Firebase.initializeApp();
    final firebaseStorage = FirebaseStorage.instance;

    var snapshot = await firebaseStorage.ref().child('images/${DateTime.now().toString()}').putFile(file);
    var downloadUrl = await snapshot.ref.getDownloadURL();

    return [downloadUrl, description];
  }

  void addMarkerToDb(String description, String imageUrl) {
    getCurrentPosition();
    FirebaseFirestore.instance.collection('marker').add({
      'creationDate': DateTime.now(),
      'description': description,
      'location': GeoPoint(
          currentPosition.latitude,
          currentPosition.longitude),
      'image': imageUrl,
      'userId': "thatOneUser"
    });
  }

}