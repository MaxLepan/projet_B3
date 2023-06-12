import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet_b3/Themes/custom_icons.dart';
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

    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: white,
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: _getBlockCount(),
        itemBuilder: (context, index) {
          return _buildBlockAtIndex(index, colors, index%2==0 ? false : true );
        },
      )
    );
  }

  int _getBlockCount() {
    int count = 1;

    if (subject.alerts != null) count++;
    if (subject.genders != null) count++;
    if (subject.reproduction != null) count++;
    if (subject.funFacts != null) count += subject.funFacts!.length;
    if (subject.diet != null) count++;
    if (subject.habitats != null) count++;
    if (subject.humanImpacts != null) count++;

    return count;
  }

  Widget _buildBlockAtIndex(int index, List<Color> color, bool highlighted) {
    switch (index) {
      case 0:
        return SpeciesViewHeader(subject: subject, mainColor: color[0]);
      case 1:
        if (subject.alerts != null) {
          return SpeciesViewBlocAlert(alert: subject.alerts!.first, mainColor: color[0], highlighted: highlighted);
        }
        break;
      case 2:
        if (subject.genders != null) {
          return SpeciesViewBlockGenres(content: subject.genders!, mainColor: color[0], highlighted: highlighted);
        }
        break;
      case 3:
        if (subject.reproduction != null) {
          return SpeciesViewBlockThreePics(content: subject.reproduction!, mainColor: color[0], title: "Reproduction", highlighted: highlighted);
        }
        break;
      case 4:
        if (subject.funFacts![0] != null) {
          return SpeciesViewBlockFunFact(funFact: subject.funFacts![0], mainColor: color[0], secondaryColor: color[1], highlighted: highlighted);
        }
        break;
      case 5:
        if (subject.diet != null) {
          return SpeciesViewBlockThreePics(content: subject.diet!, mainColor: color[0], title: "Régime alimentaire", highlighted: highlighted);
        }
        break;
      case 6:
        if (subject.funFacts![1] != null) {
          return SpeciesViewBlockFunFact(funFact: subject.funFacts![1], mainColor: color[0], secondaryColor: color[1], highlighted: highlighted);
        }
        break;
      case 7:
        if (subject.habitats != null) {
          return SpeciesViewBlockHabitats(subject: subject, mainColor: color[0], highlighted: highlighted);
        }
        break;
      case 8:
        if (subject.humanImpacts != null) {
          return SpeciesViewBlockHumanImpact(humanImpact: subject.humanImpacts![0], mainColor: color[0], highlighted: highlighted);
        }
        break;
      default:
        break;
    }
    return const SizedBox();
  }

  List<Color> _getColor(Species species) {
    switch (species.category.toLowerCase()) {
      case 'amphibien':
        return [green, lightGreen];
      case 'reptile':
        return [blue, lightBlue];
      default:
        return [orange, lightOrange];
    }
  }
}