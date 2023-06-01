
import 'package:cloud_firestore/cloud_firestore.dart';

class ContentThreePics {
  final String? title;
  final String? tag;
  final String? image1;
  final String? legend1;
  final String? image2;
  final String? legend2;
  final String? image3;
  final String? legend3;
  final String? imageBig;

  ContentThreePics(this.title, this.tag, this.image1, this.legend1, this.image2, this.legend2, this.image3, this.legend3, this.imageBig);

  static Future<ContentThreePics?> createContentThreePics(String contactThreePicsKey, Map<String, dynamic>? speciesData) async {
    DocumentReference<Map<String, dynamic>> contentThreePicsRef = speciesData![contactThreePicsKey];
    DocumentSnapshot<Map<String, dynamic>> contentThreePicsSnapshot = await contentThreePicsRef.get();

    ContentThreePics? content;
    if (contentThreePicsSnapshot.exists) {
      Map<String, dynamic>? contentThreePicsData = contentThreePicsSnapshot.data();

      content = ContentThreePics(
        contentThreePicsData?['title'],
        contentThreePicsData?['tag'],
        contentThreePicsData?['image1'],
        contentThreePicsData?['legend1'],
        contentThreePicsData?['image2'],
        contentThreePicsData?['legend2'],
        contentThreePicsData?['image3'],
        contentThreePicsData?['legend3'],
        contentThreePicsData?['image_big'],
      );
    }

    return content;
  }

}