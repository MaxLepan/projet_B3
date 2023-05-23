import 'package:flutter/material.dart';
import 'package:projet_b3/Species/species_model.dart';

class SpeciesView extends StatelessWidget {
  final Species subject;
  const SpeciesView(this.subject, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          subject.name,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}