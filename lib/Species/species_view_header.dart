import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:projet_b3/Themes/custom_icons.dart';
import 'package:projet_b3/Species/species_model.dart';

import '../Marker/marker_photo_confirmation_view.dart';
import '../Themes/colors.dart';

class SpeciesViewHeader extends StatelessWidget {
  final Species subject;
  final Color mainColor;
  final picker = ImagePicker();
  final BuildContext context;

  SpeciesViewHeader(
      {super.key,
      required this.subject,
      required this.mainColor,
      required this.context});

  Future<void> _addMarker() async {

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text(
                'Ajouter une photo',
                textAlign: TextAlign.center,
                style: GoogleFonts.rubik(
                  color: black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              content: Stack(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(const CircleBorder()),
                      padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    child: const Icon(CustomIcons.cross_01),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(CustomIcons.photo_plus_01, size: 40),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              materialGreeBrown.shade500),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(black),
                          padding:
                              MaterialStateProperty.all<EdgeInsetsGeometry>(
                                  const EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 20)),
                          elevation: MaterialStateProperty.all<double>(0),
                        ),
                        label: Text(
                          "Depuis ma caméra",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.rubik(
                            color: black,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton.icon(
                        onPressed: () async {
                          final pickedFile = await picker.pickImage(
                              source: ImageSource.gallery);
                          if (pickedFile != null) {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => MarkerPhotoConfirmationView(
                                  image: File(pickedFile.path),
                                  species: subject,
                                ),
                              ),
                            );
                          }
                        },
                        icon: const Icon(CustomIcons.image_01, size: 40),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(black),
                          padding:
                              MaterialStateProperty.all<EdgeInsetsGeometry>(
                                  const EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 20)),
                          side: MaterialStateProperty.all<BorderSide>(
                              BorderSide(
                                  color: materialGreeBrown.shade500, width: 2)),
                          elevation: MaterialStateProperty.all<double>(0),
                        ),
                        label: Text(
                          "Depuis ma galerie",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.rubik(
                            color: black,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
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
                imageWithPlaceholder(subject.imageUrl!, 270),
                if(subject.length != null)
                  Positioned(
                    left: 35,
                    bottom: 21,
                    child: Text(
                      subject.length!,
                      style: textItalicStyle
                    ),
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
        return CustomIcons.frog_01; // Replace with your desired icon for amphibians
      case 'reptile':
        return CustomIcons.snake_01; // Replace with your desired icon for reptiles
      default:
        return CustomIcons.spider_01; // Replace with a default icon if needed
    }
  }
}
