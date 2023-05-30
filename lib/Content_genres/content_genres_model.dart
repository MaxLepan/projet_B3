
import 'package:cloud_firestore/cloud_firestore.dart';

class ContentGenres {
  final String? title;
  final String? descriptionMale;
  final String? imageUrlMale;
  final String? descriptionFemale;
  final String? imageUrlFemale;

  ContentGenres(this.title, this.descriptionMale, this.imageUrlMale, this.descriptionFemale, this.imageUrlFemale);

  static Future<ContentGenres?> createContentGenres(String contactGenrestKey, Map<String, dynamic>? speciesData) async {
    DocumentReference<Map<String, dynamic>> contentGenresRef = speciesData![contactGenrestKey];
    DocumentSnapshot<Map<String, dynamic>> contentGenresSnapshot = await contentGenresRef.get();

    ContentGenres? content;
    if (contentGenresSnapshot.exists) {
      Map<String, dynamic>? contentGenresData = contentGenresSnapshot.data();

      content = ContentGenres(
        contentGenresData?['title'],
        contentGenresData?['description_male'],
        contentGenresData?['image_url_male'],
        contentGenresData?['description_female'],
        contentGenresData?['image_url_female'],
      );
    }

    return content;
  }

}