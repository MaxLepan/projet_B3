import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet_b3/Icons/species_categories_icons.dart';
import 'package:projet_b3/Species/species_model.dart';

class SpeciesViewHeader extends StatelessWidget {
  final Species subject;
  final Color mainColor;
  const SpeciesViewHeader({super.key, required this.subject, required this.mainColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
            child: Row(
              children: <Widget>[
                Text(
                  subject.name,
                  style: const TextStyle(color: Color(0xFF242a2b), fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8F1E4),
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
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  'Lorem ipsum',
                  style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
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
                    subject.shortProtectionStatus ?? "",
                    style: const TextStyle(color: Color(0xFF242a2b)),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(top: 24),
            child: FractionallySizedBox(
              widthFactor: 1.0,
              child: Image.network(
                subject.imageUrl ?? "" ,
                fit: BoxFit.fitWidth,
                height: 170,
              ),
            ),
          )
        ],
      ),
    );
  }
  IconData _getIconBySpeciesType(String category) {
    switch (category) {
      case 'amphibien':
        return SpeciesCategoriesIcons.frog; // Replace with your desired icon for amphibians
      case 'reptile':
        return SpeciesCategoriesIcons.snake; // Replace with your desired icon for reptiles
      default:
        return SpeciesCategoriesIcons.spider; // Replace with a default icon if needed
    }
  }
}
