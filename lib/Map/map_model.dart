import 'package:latlong2/latlong.dart' as latLng;

class Marker {
  Marker({
    required this.location,
    required this.creationDate,
    required this.description,
    required this.image,
    required this.userId,
  });

  final latLng.LatLng location;
  final DateTime creationDate;
  final String description;
  final String image;
  final String userId;
}