import 'package:flutter/foundation.dart';

class FilterState extends ChangeNotifier {
  bool showReptileMarkers = true;
  bool showAmphibianMarkers = true;
  bool showInsectMarkers = false;
  bool showArachnidMarkers = false;

  void toggleReptileMarkers() {
    showReptileMarkers = !showReptileMarkers;
    notifyListeners();
  }

  void toggleAmphibianMarkers() {
    showAmphibianMarkers = !showAmphibianMarkers;
    notifyListeners();
  }

  void toggleInsectMarkers() {
    showInsectMarkers = !showInsectMarkers;
    notifyListeners();
  }

  void toggleArachnidMarkers() {
    showArachnidMarkers = !showArachnidMarkers;
    notifyListeners();
  }
}