import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart' as latLng;
import 'package:projet_b3/Map/map_model.dart';

class MapViewModel {
  late Position currentPosition;
  final mapController = MapController();
  late List<CustomMarker> markers = [];
  final FirebaseFirestore fireStoreDataBase = FirebaseFirestore.instance;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  MapViewModel() {
    centerPositionOnUser();
  }

  Future<void> centerPositionOnUser() async {
    Geolocator.getCurrentPosition().then((position) {
      mapController.move(
          latLng.LatLng(position.latitude, position.longitude), 15.0);
      currentPosition = position;
    });
  }

  void getCurrentPosition() {
    Geolocator.getCurrentPosition().then((position) {
      currentPosition = position;
    });
  }

  Future<List> uploadImage(File file, String description) async {
    await Firebase.initializeApp();
    final firebaseStorage = FirebaseStorage.instance;

    var snapshot = await firebaseStorage
        .ref()
        .child('images/${DateTime.now().toString()}')
        .putFile(file);
    var downloadUrl = await snapshot.ref.getDownloadURL();

    return [downloadUrl, description];
  }

  void addMarkerToDb(String description, String imageUrl) {
    getCurrentPosition();
    fireStoreDataBase.collection('marker').add({
      'creationDate': DateTime.now(),
      'description': description,
      'location': GeoPoint(currentPosition.latitude, currentPosition.longitude),
      'image': imageUrl,
      'userId': "thatOneUser"
    });
  }

  Stream<List<CustomMarker>> getMarkerList() {
    return fireStoreDataBase.collection('marker').snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => CustomMarker.fromJson(doc.data()))
          .toList();
    });
  }

  List<Marker> customMarkersToMarkers() {
    List<Marker> markers = [];
    for (var customMarker in this.markers) {
      markers.add(Marker(
          width: 80.0,
          height: 80.0,
          point: latLng.LatLng(
              customMarker.location.latitude, customMarker.location.longitude),
          builder: (ctx) => GestureDetector(
              onTap: () {
                showDialog(
                    context: scaffoldKey.currentContext!,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          Image.network(
                            customMarker.image,
                            fit: BoxFit.contain,
                          ),
                          Text(customMarker.description),
                          Text(customMarker.speciesName)
                        ]),
                      );
                    });
              },
              child: Image.network(
                customMarker.image,
                fit: BoxFit.cover,
              ))));
    }
    return markers;
  }

  Marker customMarkerToMarker(CustomMarker customMarker) {
    return Marker(
        width: 80.0,
        height: 80.0,
        point: latLng.LatLng(
            customMarker.location.latitude, customMarker.location.longitude),
        builder: (ctx) => GestureDetector(
            onTap: () {
              showDialog(
                  context: scaffoldKey.currentContext!,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content:
                          Column(mainAxisSize: MainAxisSize.min, children: [
                        Image.network(
                          customMarker.image,
                          fit: BoxFit.contain,
                        ),
                        Text(customMarker.description),
                        Text(customMarker.speciesName)
                      ]),
                    );
                  });
            },
            child: Image.network(
              customMarker.image,
              fit: BoxFit.cover,
            )));
  }
}
