import 'package:cloud_firestore/cloud_firestore.dart';

class Species {
  final String name;
  final String latinName;
  final String category;
  final String? protectionStatus;
  final List<String>? habitats;
  final List<dynamic>? humanImpacts;
  final Timestamp? lastView;
  final List<dynamic>? funFacts;
  final String? imageUrl;
  final Map? genders;
  final Map? reproduction;
  final List<dynamic>? alerts;
  final Map? diet;


  Species({
    required this.name,
    required this.latinName,
    required this.category,
    this.habitats,
    this.protectionStatus,
    this.lastView,
    this.humanImpacts,
    this.funFacts,
    this.imageUrl,
    this.genders,
    this.reproduction,
    this.alerts,
    this.diet
  });

  @override
  String toString() {
    return (name);
  }
}