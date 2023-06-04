import 'package:cloud_firestore/cloud_firestore.dart';

import '../Content_genres/content_genres_model.dart';
import '../Content_simple/content_simple_model.dart';
import '../Content_three_pics/content_three_pics.dart';

class Species {
  final String name;
  final String latinName;
  final String category;
  final String? shortProtectionStatus;
  final List<String>? habitats;
  final SimpleContent? humanImpact;
  final Timestamp? lastView;
  final SimpleContent? funFact1;
  final SimpleContent? funFact2;
  final String? imageUrl;
  final ContentGenres? contentGenres;
  final ContentThreePics? reproduction;
  final SimpleContent? alert;
  final ContentThreePics? alimentation;


  Species({
    required this.name,
    required this.latinName,
    required this.category,
    this.habitats,
    this.shortProtectionStatus,
    this.lastView,
    this.humanImpact,
    this.funFact1,
    this.funFact2,
    this.imageUrl,
    this.contentGenres,
    this.reproduction,
    this.alert,
    this.alimentation
  });

  @override
  String toString() {
    return (name);
  }
}