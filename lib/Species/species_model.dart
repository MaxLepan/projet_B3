import 'package:cloud_firestore/cloud_firestore.dart';

import '../Content_genres/content_genres_model.dart';
import '../Content_simple/content_simple_model.dart';
import '../Content_three_pics/content_three_pics.dart';

class Species {
  final String name;
  final String latinName;
  final String description;
  final String category;
  final String? protectionStatus;
  final String? shortProtectionStatus;
  final List<String>? habitats;
  final SimpleContent? humanImpact;
  final Timestamp? lastView;
  final String? observable;
  final SimpleContent? funFact1;
  final SimpleContent? funFact2;
  final String? imageUrl;
  final ContentGenres? contentGenres;
  final ContentThreePics? reproduction;
  final SimpleContent? alert;


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
    this.contentGenres,
    this.reproduction,
    this.alert
  });

  @override
  String toString() {
    return (name);
  }
}