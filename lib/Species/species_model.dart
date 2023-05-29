import 'package:cloud_firestore/cloud_firestore.dart';

import '../Fun_facts/fun_facts_model.dart';

class Species {
  final String name;
  final String latinName;
  final String description;
  final String category;
  final String? protectionStatus;
  final String? shortProtectionStatus;
  final List<String>? habitats;
  final List<String>? humanImpact;
  final Timestamp? lastView;
  final String? observable;
  final FunFact? funFact1;
  final FunFact? funFact2;
  final String? imageUrl;
  final Map? imagesGenre;


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
    this.funFact1,
    this.funFact2,
    this.imageUrl,
    this.observable,
    this.imagesGenre,
  });

  @override
  String toString() {
    return (name);
  }
}