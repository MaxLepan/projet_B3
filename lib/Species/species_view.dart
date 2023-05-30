import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet_b3/Species/species_model.dart';
import 'package:projet_b3/Species/species_model_block_three_pics.dart';
import 'package:projet_b3/Species/species_view_block_fun_fact.dart';
import 'package:projet_b3/Species/species_view_block_genres.dart';
import 'package:projet_b3/Species/species_view_block_habitats.dart';
import 'package:projet_b3/Species/species_view_block_human_impact.dart';
import 'package:projet_b3/Species/species_view_header.dart';
import 'package:projet_b3/Themes/colors.dart';

class SpeciesView extends StatelessWidget {
  final Species subject;

  const SpeciesView(this.subject, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Color> colors = _getColor(subject);

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading:Container(
          margin: const EdgeInsets.only(top: 3),
          child: IconButton(
            icon: const Icon(CupertinoIcons.xmark, size: 28,),
            onPressed: () { Navigator.pop(context); },
          ),
        ),
        elevation: 0.0,
        iconTheme: const IconThemeData(color: black),
        backgroundColor: Colors.white,
        title: const Text("Fermer", style: TextStyle(color: black, fontSize: 18)),
      ),
      body: ListView(
          children: <Widget>[
            SpeciesViewHeader(subject: subject, mainColor: colors[0]),
            if(subject.contentGenres != null)
              SpeciesViewBlockGenres(content: subject.contentGenres!, mainColor: colors[0]),
            if(subject.reproduction != null)
              SpeciesViewBlockThreePics(content: subject.reproduction!, mainColor: colors[0]),
            if(subject.funFact1 != null)
              SpeciesViewBlockFunFact(funFact: subject.funFact1!, mainColor: colors[0], secondaryColor: colors[1]),
            if(subject.habitats != null)
              SpeciesViewBlockHabitats(subject: subject, mainColor: colors[0]),
            if(subject.funFact2 != null)
              SpeciesViewBlockFunFact(funFact: subject.funFact2!, mainColor: colors[0], secondaryColor: colors[1]),
            if(subject.humanImpact != null)
              SpeciesViewBlockHumanImpact(humanImpact: subject.humanImpact!, mainColor: colors[0]),
          ],
        ),
    );
  }

  List<Color> _getColor(Species species) {
    switch (species.category) {
      case 'amphibien':
        return [green, lightGreen]; // Replace with your desired icon for amphibians
      case 'reptile':
        return [blue, lightBlue]; // Replace with your desired icon for reptiles
      default:
        return [orange, lightOrange]; // Replace with a default icon if needed
    }
  }

}