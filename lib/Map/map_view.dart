import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latlong2/latlong.dart' as latLng;

void main() {
  runApp(const MapView());
}

class MapView extends StatelessWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Map de fou',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Map'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MapState();
}

final scaffoldKey = GlobalKey<ScaffoldState>();

class _MapState extends State<MyHomePage> {
  final List<Marker> _markers = [];
  final picker = ImagePicker();
  final mapController = MapController();
  late Position _currentPosition;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    final Position position = await Geolocator.getCurrentPosition();
    setState(() {
      _currentPosition = position;
      mapController.move(
          latLng.LatLng(position.latitude, position.longitude), 15.0);
    });
  }

  Future<void> _addMarker() async {
    String description = '';
    File? image;

    await showDialog(
        context: scaffoldKey.currentContext!,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
                title: const Text('Ajouter un marqeur'),
                content:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  TextField(
                    decoration: const InputDecoration(
                      hintText: 'Entrez une description',
                    ),
                    onChanged: (value) {
                      description = value;
                    },
                  ),
                  Stack(
                    children: [
                      GestureDetector(
                          onTap: () async {
                            final pickedFile = await picker.pickImage(
                                source: ImageSource.gallery);
                            if (pickedFile != null) {
                              setState(() {
                                image = File(pickedFile.path);
                              });
                            }
                          },
                          child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 20),
                              height: 100,
                              width: 100,
                              child: image != null
                                  ? Image.file(
                                      image!,
                                      fit: BoxFit.cover,
                                    )
                                  : const Icon(
                                      Icons.add_a_photo,
                                      size: 50,
                                    ))),
                    ],
                  ),
                ]),
                actions: <Widget>[
                  TextButton(
                    child: const Text('Annuler'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  ElevatedButton(
                    onPressed: (image != null && description.isNotEmpty)
                        ? () {
                            setState(() {
                              _markers.add(newMarker(image, description));
                              image = null;
                              description = '';
                            });
                            Navigator.of(context).pop();
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      disabledBackgroundColor: Colors.grey,
                      disabledForegroundColor: Colors.black,
                    ),
                    child: const Text('Ajouter'),
                  ),
                ]);
          });
        });
  }

  Marker newMarker(File? image, String description) {
    return Marker(
        width: 80.0,
        height: 80.0,
        point: latLng.LatLng(
            _currentPosition.latitude, _currentPosition.longitude),
        builder: (ctx) => GestureDetector(
            onTap: () {
              showDialog(
                  context: scaffoldKey.currentContext!,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content:
                          Column(mainAxisSize: MainAxisSize.min, children: [
                        Image.file(
                          image!,
                          fit: BoxFit.contain,
                        ),
                        Text(description)
                      ]),
                    );
                  });
            },
            child: Image.file(
              image!,
              fit: BoxFit.cover,
            )));
  }

  Widget drawMap(BuildContext context) {
    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
        center: latLng.LatLng(0, 0),
        zoom: 13.0,
      ),
      nonRotatedChildren: [
        AttributionWidget.defaultWidget(
          source: 'OpenStreetMap contributors',
          onSourceTapped: null,
        )
      ],
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.app',
        ),
        CurrentLocationLayer(),
        MarkerLayer(
          markers: _markers,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Stack(
        children: <Widget>[
          drawMap(context),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: _addMarker,
        tooltip: 'Add Marker',
        child: const Icon(Icons.add),
      ),
    );
  }
}
