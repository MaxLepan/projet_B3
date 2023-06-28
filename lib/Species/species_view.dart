import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet_b3/Species/species_view_block_reproduction.dart';
import 'package:projet_b3/Themes/unseen_icons.dart';
import 'package:projet_b3/Species/species_model.dart';
import 'package:projet_b3/Species/species_model_block_three_pics.dart';
import 'package:projet_b3/Species/species_view_block_alert.dart';
import 'package:projet_b3/Species/species_view_block_fun_fact.dart';
import 'package:projet_b3/Species/species_view_block_genres.dart';
import 'package:projet_b3/Species/species_view_block_habitats.dart';
import 'package:projet_b3/Species/species_view_block_human_impact.dart';
import 'package:projet_b3/Species/species_view_header.dart';
import 'package:projet_b3/Themes/app_bar.dart';
import 'package:projet_b3/Themes/colors.dart';

class SpeciesView extends StatelessWidget {
  final Species subject;
  const SpeciesView(this.subject, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Color> colors = _getColor(subject);
    var count = 0;

    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: white,
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          for(var block in blockBuilder(colors, context))
            block
        ],
      )
    );
  }


  List<Widget> blockBuilder(List<Color> colors, context){
    List<Widget> blocks = [];
    var count = 0;
    blocks.add(SpeciesViewHeader(subject: subject, mainColor: colors[0], secondaryColor: colors[1], context: context));

    if (subject.alerts != null){
      count ++;
      blocks.add(SpeciesViewBlocAlert(alert: subject.alerts!.first, mainColor: colors[0], highlighted: count%2 == 0 ? false : true));
    }

    if (subject.genders != null){
      count ++;
      blocks.add(SpeciesViewBlockGenres(content: subject.genders!, mainColor: colors[0], highlighted: count%2 == 0 ? false : true));
    }

    if (subject.reproduction != null){
      count ++;
      blocks.add(SpeciesViewBlockReproduction(content: subject.reproduction!, mainColor: colors[0], highlighted: count%2 == 0 ? false : true));
    }

    if (subject.funFacts![0] != null) {
      count ++;
      blocks.add(SpeciesViewBlockFunFact(funFact: subject.funFacts![0], mainColor: colors[0], secondaryColor: colors[1], highlighted: count % 2 == 0 ? false : true));

    }

    if (subject.diet != null){
      count ++;
      blocks.add(SpeciesViewBlockThreePics(content: subject.diet!, mainColor: colors[0], highlighted: count%2 == 0 ? false : true, title: "Régime alimentaire"));
    }

    if (subject.funFacts!.length > 1) {
      if (subject.funFacts![1] != null) {
        count ++;
        blocks.add(SpeciesViewBlockFunFact(funFact: subject.funFacts![1], mainColor: colors[0], secondaryColor: colors[1], highlighted: count % 2 == 0 ? false : true));
      }
    }

    if (subject.habitats != null){
      count ++;
      blocks.add(SpeciesViewBlockHabitats(subject: subject, mainColor: colors[0], highlighted: count%2 == 0 ? false : true));
    }

    if (subject.humanImpacts != null){
      count ++;
      blocks.add(SpeciesViewBlockHumanImpact(humanImpact: subject.humanImpacts![0], mainColor: colors[0], highlighted: count%2 == 0 ? false : true));
    }

    return blocks;
  }


  List<Color> _getColor(Species species) {
    switch (species.category.toLowerCase()) {
      case 'amphibien':
        return [green, lightGreen];
      case 'reptile':
        return [blue, lightBlue];
      case 'araignée':
        return [red, lightRed];
      case 'prédateur':
        return [red, lightRed];
      default:
        return [orange, lightOrange];
    }
  }
}