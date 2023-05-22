import 'package:flutter/material.dart';
import 'package:projet_b3/Search/graph_tree_v2.dart';
import 'package:projet_b3/Search/search_quizz_view.dart';
import 'package:projet_b3/Search/search_view.dart';
import 'Home/home_view.dart';
import 'Map/map_view.dart';
import 'Questions/questions_result_view.dart';
import 'Species/species_model.dart';

final Map<String, WidgetBuilder> routes = {
  '/home': (BuildContext context) => HomePage(),
  '/map': (BuildContext context) => MapView(),
  '/search': (BuildContext context) => SearchView(),
  '/questions': (BuildContext context) {
    final args = ModalRoute
        .of(context)!
        .settings
        .arguments as Node?;
      return SearchQuizzView(args);
    },
  '/questions/result': (BuildContext context){
    final args = ModalRoute
        .of(context)!
        .settings
        .arguments as Object;
    return  QuestionsResultView(args);
  },
  '/sheet': (BuildContext context){
    final args = ModalRoute
        .of(context)!
        .settings
        .arguments as Species;
    return  QuestionsResultView(args);
  }
};