import 'package:cloud_firestore/cloud_firestore.dart';

class Species {
  final String name;
  final String description;
  final String category;
  final String? protectionStatus;
  final String? habitat;
  final String? humanImpact;
  final Timestamp? lastView;
  final String? observable;
  final String? funFact;
  final String? imageUrl;

  Species({
    required this.name,
    required this.description,
    required this.category,
    this.habitat,
    this.protectionStatus,
    this.lastView,
    this.humanImpact,
    this.funFact,
    this.imageUrl,
    this.observable,
  });

  @override
  String toString() {
    return ("$name");
  }
}