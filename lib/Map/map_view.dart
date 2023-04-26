import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart' as latLng;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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

class _MapState extends State<MyHomePage> {

  final List<Marker> _markers = [];
  late Future<Position> _currentPositionFuture;

  @override
  void initState() {
    super.initState();
    _currentPositionFuture = _getCurrentLocation();
  }

  void _addMarker() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(
        "Latitude : ${position.latitude} | Longitude : ${position.longitude}");
    setState(() {
      _markers.add(Marker(
        width: 80.0,
        height: 80.0,
        point: latLng.LatLng(position.latitude, position.longitude),
        builder: (ctx) => const Icon(Icons.location_on),
      ));
      print("Markers Length : ${_markers.length}");
    });
  }

  Future<Position> _getCurrentLocation() async {
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Widget drawMap(BuildContext context){
    return FutureBuilder<Position>(
        future: _currentPositionFuture,
        builder: (BuildContext context, AsyncSnapshot<Position> snapshot) {
          if (snapshot.hasData) {
            final currentPosition = snapshot.data;
            return FlutterMap(
              options: MapOptions(
                center: latLng.LatLng(currentPosition!.latitude, currentPosition.longitude),
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
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
