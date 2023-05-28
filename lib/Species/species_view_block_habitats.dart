import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet_b3/Species/species_model.dart';
import 'package:projet_b3/Themes/colors.dart';

class SpeciesViewBlockHabitats extends StatelessWidget {
  final Species subject;
  final Color mainColor;
  const SpeciesViewBlockHabitats({super.key, required this.subject, required this.mainColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: beige,
      body:
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: <Widget> [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Habitats",
                    style: TextStyle(color: black, fontSize: 21, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    children: [
                      for (var item in subject.habitats!)
                        Container(
                          margin: const EdgeInsets.only(right: 8, bottom: 8),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: green,
                            borderRadius: BorderRadius.circular(2.0),
                          ),
                          child: Text(
                            item,
                            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ],
          )
        )
    );
  }
}