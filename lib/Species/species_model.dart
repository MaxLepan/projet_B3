import 'package:cloud_firestore/cloud_firestore.dart';

class Species {
  final String name;
  final String latinName;
  final String description;
  final String category;
  final String? protectionStatus;
  final String? shortProtectionStatus;
  final List<String>? habitats;
  final String? humanImpact;
  final Timestamp? lastView;
  final String? observable;
  final String? funFact;
  final String? imageUrl;

  Species({
    required this.name,
    required this.latinName,
    required this.description,
    required this.category,
    this.habitats,
    this.shortProtectionStatus,
    this.protectionStatus,
    this.lastView,
    this.humanImpact,
    this.funFact,
    this.imageUrl,
    this.observable,
  });

  @override
  String toString() {
    return (name);
  }
}