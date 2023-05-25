import 'package:flutter/material.dart';
import 'package:projet_b3/Species/species_model.dart';

class SpeciesView extends StatelessWidget {
  final Species subject;

  const SpeciesView(this.subject, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xFF3EB5DA)),
        backgroundColor: Colors.white,
        title: const Text("Retour", style: TextStyle(color: Color(0xFF3EB5DA)),),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
            child: Row(
              children: <Widget>[
                Text(
                  subject.name,
                  style: const TextStyle(fontSize: 24),
                ),
                const Spacer(),
                Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xFFB2E1F0),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    _getIconBySpeciesType(subject.category),
                    style: const TextStyle(fontSize: 24),
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
                    color: const Color(0xFF3EB5DA),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    subject.shortProtectionStatus ?? "",
                    style: TextStyle(color: Colors.white),
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

  String _getIconBySpeciesType(String category) {
    switch (category) {
      case 'amphibien':
        return "🐸"; // Replace with your desired icon for amphibians
      case 'reptile':
        return "🦎"; // Replace with your desired icon for reptiles
      default:
        return "🕐"; // Replace with a default icon if needed
    }
  }
}