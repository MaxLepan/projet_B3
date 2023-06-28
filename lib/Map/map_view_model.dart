import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart' as latLng;
import 'package:projet_b3/Map/map_model.dart';
import 'package:projet_b3/Marker/marker_view.dart';
import 'package:projet_b3/Themes/colors.dart';

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

  Stream<List<CustomMarker>> getMarkerList() {
    return fireStoreDataBase.collection('marker').snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => CustomMarker.fromJson(doc.data()))
          .toList();
    });
  }

  Marker customMarkerToMarker(CustomMarker customMarker, BuildContext context) {

    final Color borderColor;

    if (customMarker.speciesCategory == "Reptile"){
      borderColor = purple_02;
    } else if (customMarker.speciesCategory == "Amphibien"){
      borderColor = mint_02;
    } else {
      borderColor = Colors.black;
    }

    return Marker(
      width: 80.0,
      height: 80.0,
      point: latLng.LatLng(
          customMarker.location.latitude, customMarker.location.longitude),
      builder: (ctx) => GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MarkerView(marker: customMarker, context: context),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: white,
            shape: BoxShape.circle,
            border: Border.all(color: borderColor, width: 4),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: ExtendedImage.network(
              customMarker.image,
              fit: BoxFit.cover,
              cache: true,
              loadStateChanged: (ExtendedImageState state) {
                switch (state.extendedImageLoadState) {
                  case LoadState.loading:
                    return Container(
                      color: Colors.grey,
                    );
                  case LoadState.completed:
                    return null;
                  case LoadState.failed:
                    return Container(
                      color: greenBrown,
                    );
                }
              }
            ),
          ),
        ),
      ),
    );
  }
}
