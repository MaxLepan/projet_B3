import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart' as latLng;

CustomPosition geoPointToPosition(GeoPoint geoPoint){
  return CustomPosition(latitude: geoPoint.latitude, longitude: geoPoint.longitude);
}

class CustomPosition {
  CustomPosition({required this.latitude, required this.longitude});

  final double latitude;
  final double longitude;
}

class CustomMarker {
  CustomMarker({
    required this.location,
    required this.creationDate,
    required this.description,
    required this.image,
    required this.userId,
  });

  final CustomPosition location;
  final DateTime creationDate;
  final String description;
  final String image;
  final String userId;

  CustomMarker.fromJson(Map<String, dynamic> parsedJson)
      : location = geoPointToPosition(parsedJson['location']),
        creationDate = (parsedJson['creationDate'] as Timestamp).toDate(),
        description = parsedJson['description'],
        image = parsedJson['image'],
        userId = parsedJson['userId'];

}