
import 'package:cloud_firestore/cloud_firestore.dart';

class SimpleContent {
  final String? title;
  final String? description;
  final String? text;
  final String? image;

  SimpleContent(this.title, this.description, this.text, this.image);

  static Future<SimpleContent?> createContentSimple(String contentSimpleKey, Map<String, dynamic>? speciesData) async {
    DocumentReference<Map<String, dynamic>> contentSimpleRef = speciesData![contentSimpleKey];
    DocumentSnapshot<Map<String, dynamic>> contentSimpleSnapshot = await contentSimpleRef.get();

    SimpleContent? content;
    if (contentSimpleSnapshot.exists) {
      Map<String, dynamic>? contentSimpleData = contentSimpleSnapshot.data();

      content = SimpleContent(
        contentSimpleData?['title'],
        contentSimpleData?['description'],
        contentSimpleData?['text'],
        contentSimpleData?['image_url'],
      );
    }

    return content;
  }
}