import 'package:flutter/material.dart';
import 'package:projet_b3/Questions/question_result_choice_view.dart';
import 'package:projet_b3/Search/search_quizz_view.dart';
import 'package:projet_b3/Search/search_view.dart';
import 'package:projet_b3/Search/transition_view.dart';
import 'package:projet_b3/Species/species_model.dart';
import 'Map/map_view.dart';
import 'Questions/questions_result_view.dart';
import 'Search/graph_tree.dart';
import 'Species/species_view.dart';

final Map<String, WidgetBuilder> routes = {
  '/map': (BuildContext context) => MapView(),
  '/search': (BuildContext context) => SearchView(),
  '/transition': (BuildContext context) => TransitionView(),
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
  '/questions/result/choice': (BuildContext context){
    final args = ModalRoute
        .of(context)!
        .settings
        .arguments as Species;
    return  QuestionsResultChoiceView(args);
  },
  '/sheet': (BuildContext context){
    final args = ModalRoute
        .of(context)!
        .settings
        .arguments as Species;
    return  SpeciesView(args);
  },

};