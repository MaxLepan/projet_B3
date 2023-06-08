import 'package:cloud_firestore/cloud_firestore.dart';

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
    required this.speciesName,
    required this.speciesCategory
  });

  final CustomPosition location;
  final DateTime creationDate;
  final String description;
  final String image;
  final String userId;
  final String speciesName;
  final String speciesCategory;

  CustomMarker.fromJson(Map<String, dynamic> parsedJson)
      : location = geoPointToPosition(parsedJson['location']),
        creationDate = (parsedJson['creationDate'] as Timestamp).toDate(),
        description = parsedJson['description'],
        image = parsedJson['image'],
        userId = parsedJson['userId'],
        speciesName = parsedJson['species']['name'],
        speciesCategory = parsedJson['species']['category'];

}