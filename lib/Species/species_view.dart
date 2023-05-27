import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet_b3/Species/species_model.dart';
import 'package:projet_b3/Species/species_view_header.dart';

class SpeciesView extends StatelessWidget {
  final Species subject;

  const SpeciesView(this.subject, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color mainColor = _getColor(subject);

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading:Container(margin: const EdgeInsets.only(top: 3),child: const Icon(CupertinoIcons.xmark, size: 28),),
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Color(0xFF242a2b)),
        backgroundColor: Colors.white,
        title: const Text("Fermer", style: TextStyle(color: Color(0xFF242a2b), fontSize: 18), ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: SpeciesViewHeader(subject: subject, mainColor: mainColor),
          ),
        ],
      ),
    );
  }

  Color _getColor(Species species) {
    switch (species.category) {
      case 'amphibien':
        return const Color(0xFFA4C89A); // Replace with your desired icon for amphibians
      case 'reptile':
        return const Color(0xFFB6ABD4); // Replace with your desired icon for reptiles
      default:
        return const Color(0xFFEBA15A); // Replace with a default icon if needed
    }
  }

}