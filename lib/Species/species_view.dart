import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet_b3/Species/species_model.dart';
import 'package:projet_b3/Species/species_view_block_genres.dart';
import 'package:projet_b3/Species/species_view_block_habitats.dart';
import 'package:projet_b3/Species/species_view_header.dart';
import 'package:projet_b3/Themes/colors.dart';

class SpeciesView extends StatelessWidget {
  final Species subject;

  const SpeciesView(this.subject, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color mainColor = _getColor(subject);

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
            SpeciesViewHeader(subject: subject, mainColor: mainColor),
            if(subject.imagesGenre != null)
              SpeciesViewBlockGenres(subject: subject, mainColor: mainColor),
            if(subject.habitats != null)
              SpeciesViewBlockHabitats(subject: subject, mainColor: mainColor),
          ],
        ),
    );
  }

  Color _getColor(Species species) {
    switch (species.category) {
      case 'amphibien':
        return green; // Replace with your desired icon for amphibians
      case 'reptile':
        return blue; // Replace with your desired icon for reptiles
      default:
        return orange; // Replace with a default icon if needed
    }
  }

}