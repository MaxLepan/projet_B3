import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:projet_b3/Questions/question_result_choice_view.dart';
import 'package:projet_b3/Search/search_quizz_view.dart';
import 'package:projet_b3/Search/search_view.dart';
import 'package:projet_b3/Search/transition_view.dart';
import 'package:projet_b3/Species/species_model.dart';
import 'Map/map_view.dart';
import 'Questions/question_many_results_view.dart';
import 'Questions/questions_result_view.dart';
import 'Species/species_view.dart';
import 'Tree/node.dart';
import 'Tree/tree.dart';
import 'coming_soon_view.dart';

final Map<String, WidgetBuilder> routes = {
  '/map': (BuildContext context) => MapView(),
  '/search': (BuildContext context) => SearchView(),
  '/transition': (BuildContext context) => TransitionView(),
  '/comming_soon': (BuildContext context) {
    final showCloseButton = ModalRoute
      .of(context)!
      .settings
      .arguments as bool;
    return ComingSoonView(showCloseButton: showCloseButton,);
  } ,
  '/questions': (BuildContext context) {
    final arguments = ModalRoute
        .of(context)!
        .settings
        .arguments as Map<String, dynamic>;
    final node = arguments['node'] as Node?;
    final tree = arguments['tree'] as Tree;
    final quizType = arguments['quizType'] as String?;

    return SearchQuizzView(node, tree, quizType: quizType);
  },
  '/questions/species_result': (BuildContext context){
    final args = ModalRoute
        .of(context)!
        .settings
        .arguments as Object;
    return QuestionsResultView(args);
  },
  '/questions/environment_result': (BuildContext context){
    final args = ModalRoute
        .of(context)!
        .settings
        .arguments as List<Node>;
    return QuestionManyResultsView(args);
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