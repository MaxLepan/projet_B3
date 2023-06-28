import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latlong2/latlong.dart' as latLng;
import 'package:firebase_core/firebase_core.dart';
import 'package:projet_b3/Map/map_model.dart';
import 'package:projet_b3/Map/map_view_model.dart';
import 'package:provider/provider.dart';

import '../Expandable_button/expandable_button.dart';
import '../Themes/colors.dart';
import '../Themes/unseen_icons.dart';
import '../filters_state.dart';

class MapView extends StatelessWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: materialGreeBrown,
        scaffoldBackgroundColor: white,
      ),
      home: const MapPage(),
    );
  }
}

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapState();
}

class _MapState extends State<MapPage> {
  final picker = ImagePicker();

  late MapViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = MapViewModel();
  }

  void _centerPositionOnUser() {
    viewModel.centerPositionOnUser();
  }

  Marker newMarker(File? image, String description) {
    return Marker(
      width: 80.0,
      height: 80.0,
      point: latLng.LatLng(viewModel.currentPosition.latitude,
          viewModel.currentPosition.longitude),
      builder: (ctx) => GestureDetector(
        onTap: () {
          showDialog(
            context: viewModel.scaffoldKey.currentContext!,
            builder: (BuildContext context) {
              return AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.file(
                      image!,
                      fit: BoxFit.contain,
                    ),
                    Text(description)
                  ],
                ),
              );
            },
          );
        },
        child: Image.file(
          image!,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: viewModel.scaffoldKey,
      body: Center(
        child: Stack(
          children: <Widget>[
            MapWidget(
                allMarkers: viewModel.getMarkerList(), viewModel: viewModel),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(top: 70.0),
            child: ExpandableButton(),
          ),
          FloatingActionButton(
            heroTag: null,
            onPressed: _centerPositionOnUser,
            tooltip: 'Center on user',
            elevation: 0,
            backgroundColor: beige,
            foregroundColor: black,
            shape: const RoundedRectangleBorder(
              side: BorderSide(color: beige_03, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(3.0)),
            ),
            child: const Icon(CustomIcons.center_01, color: black, size: 35),
          ),
        ],
      ),
    );
  }
}

class MapWidget extends StatelessWidget {
  final Stream<List<CustomMarker>> allMarkers;
  final MapViewModel viewModel;

  const MapWidget({
    super.key,
    required this.allMarkers,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    final filterState = Provider.of<FilterState>(context);

    return StreamBuilder<List<CustomMarker>>(
        stream: viewModel.getMarkerList(),
        builder: (ctx, snapshot) {
          if (snapshot.hasData) {
            viewModel.markers = snapshot.data!;
            return FlutterMap(
              mapController: viewModel.mapController,
              options: MapOptions(
                center: latLng.LatLng(45.9077, 6.1020),
                zoom: 15.0,
                interactiveFlags: InteractiveFlag.all & ~InteractiveFlag.rotate,
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      'https://api.maptiler.com/maps/outdoor-v2/{z}/{x}/{y}.png?key=RW4eCQMolu3ErCAsYJV1',
                  userAgentPackageName: 'com.gardiens.AppB3Projet',
                ),
                CurrentLocationLayer(),
                MarkerLayer(
                  markers: viewModel.markers
                      .where((marker) =>
                          (filterState.showReptileMarkers &&
                              marker.speciesCategory == 'Reptile') ||
                          (filterState.showAmphibianMarkers &&
                              marker.speciesCategory == 'Amphibien') ||
                          (filterState.showInsectMarkers &&
                              marker.speciesCategory == 'Insecte') ||
                          (filterState.showArachnidMarkers &&
                              marker.speciesCategory == 'Arachnide'))
                      .map((marker) =>
                          viewModel.customMarkerToMarker(marker, context))
                      .toList(),
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
