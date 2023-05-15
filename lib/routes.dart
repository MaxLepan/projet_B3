import 'package:flutter/material.dart';
import 'package:projet_b3/Search/search_quizz_view.dart';
import 'package:projet_b3/Search/search_view.dart';
import 'Home/home_view.dart';
import 'Map/map_view.dart';

final Map<String, WidgetBuilder> routes = {
  '/home': (BuildContext context) => HomePage(),
  '/map': (BuildContext context) => MapView(),
  '/search': (BuildContext context) => SearchView(),
  '/questions': (BuildContext context) {
    final args = ModalRoute
        .of(context)!
        .settings
        .arguments as String;
      return SearchQuizzView(args);
    },
};