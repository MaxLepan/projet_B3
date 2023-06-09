import 'package:flutter/foundation.dart';

class FilterState extends ChangeNotifier {
  bool showReptileMarkers = true;
  bool showAmphibianMarkers = true;

  void toggleReptileMarkers() {
    showReptileMarkers = !showReptileMarkers;
    notifyListeners();
  }

  void toggleAmphibianMarkers() {
    showAmphibianMarkers = !showAmphibianMarkers;
    notifyListeners();
  }
}