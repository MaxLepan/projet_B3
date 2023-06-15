import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:projet_b3/Species/species_view_model.dart';
import 'package:projet_b3/Themes/custom_icons.dart';
import 'package:projet_b3/Species/species_model.dart';

import '../Marker/marker_view_model.dart';
import '../Themes/colors.dart';

class SpeciesViewHeader extends StatelessWidget {
  final Species subject;
  final Color mainColor;
  final picker = ImagePicker();
  final MarkerViewModel viewModel = MarkerViewModel();
  final BuildContext context;

  SpeciesViewHeader(
      {super.key, required this.subject, required this.mainColor, required this.context});

  Future<void> _addMarker() async {
    File? image;

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Ajouter une photo'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Stack(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          final pickedFile = await picker.pickImage(
                              source: ImageSource.gallery);
                          if (pickedFile != null) {
                            setState(() {
                              image = File(pickedFile.path);
                            });
                          }
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          height: 100,
                          width: 100,
                          child: image != null
                              ? Image.file(
                                  image!,
                                  fit: BoxFit.cover,
                                )
                              : const Icon(
                                  Icons.add_a_photo,
                                  size: 50,
                                ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Annuler'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                ElevatedButton(
                  onPressed: (image != null)
                      ? () {
                          setState(() {
                            //viewModel.markers.add(newMarker(image, description));
                            viewModel.uploadImage(image!).then((value) =>
                                {viewModel.addMarkerToDb(value, subject)});
                            image = null;
                          });
                          Navigator.of(context).pop();
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    disabledBackgroundColor: Colors.grey,
                    disabledForegroundColor: Colors.black,
                  ),
                  child: const Text('Ajouter'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 16),
            padding: horizontalPadding,
            child: Row(
              children: <Widget>[
                Text(
                  "${subject.name[0].toUpperCase()}${subject.name.substring(1).toLowerCase()}",
                  style: const TextStyle(
                      color: black, fontSize: 24, fontWeight: FontWeight.bold),
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
                const Spacer(),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: darkBeige,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: mainColor,
                      width: 2.0,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 1),
                    child: Icon(
                      _getIconBySpeciesType(subject.category),
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: horizontalPadding,
            child: Text(
              subject.latinName,
              style: textItalicStyle,
            ),
          ),
          Container(
            margin: horizontalPadding,
            padding: const EdgeInsets.only(top: 5, right: 16),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                subject.protectionStatus ?? "",
                style: const TextStyle(
                    color: black, fontWeight: FontWeight.w500, fontSize: 17),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 24),
            child: Stack(
              children: [
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(subject.imageUrl ?? ""),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  left: 35,
                  bottom: 21,
                  child: Text("L. 16cm", style: textItalicStyle),
                ),
              ],
            ),
          ),
          Container(
            color: darkBeige,
            padding:
                const EdgeInsets.only(top: 16, left: 28, right: 28, bottom: 16),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        _addMarker();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: greenBrown, elevation: 0),
                      child: Container(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: const Icon(
                                  CustomIcons.photo_plus_01,
                                  color: black,
                                  size: 30,
                                ),
                              ),
                              Text(
                                "Ajouter ma photo sur la carte",
                                style: textBoldStyle,
                              ),
                            ],
                          ))),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  IconData _getIconBySpeciesType(String category) {
    switch (category.toLowerCase()) {
      case 'amphibien':
        return CustomIcons
            .frog_01; // Replace with your desired icon for amphibians
      case 'reptile':
        return CustomIcons
            .snake_01; // Replace with your desired icon for reptiles
      default:
        return CustomIcons.spider_01; // Replace with a default icon if needed
    }
  }
}
