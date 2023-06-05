import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet_b3/Icons/custom_icons.dart';
import 'package:projet_b3/Species/species_model.dart';

import '../Themes/colors.dart';

class SpeciesViewHeader extends StatelessWidget {
  final Species subject;
  final Color mainColor;
  const SpeciesViewHeader({super.key, required this.subject, required this.mainColor});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
            child: Row(
              children: <Widget>[
                Text(
                  subject.name,
                  style: const TextStyle(color: black, fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: darkBeige,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: mainColor,
                      width: 2.0,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 1),
                    child: Icon(
                      _getIconBySpeciesType(subject.category),
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  subject.latinName,
                  style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 8, right: 16),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    subject.protectionStatus ?? "",
                    style: const TextStyle(color: black, fontWeight: FontWeight.w500, fontSize: 17),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(top: 24),
            child: Container(
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(subject.imageUrl ?? ""),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      );
  }
  IconData _getIconBySpeciesType(String category) {
    switch (category.toLowerCase()) {
      case 'amphibien':
        return CustomIcons.frog; // Replace with your desired icon for amphibians
      case 'reptile':
        return CustomIcons.snake; // Replace with your desired icon for reptiles
      default:
        return CustomIcons.spider; // Replace with a default icon if needed
    }
  }
}
