import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projet_b3/Marker/marker_photo_confirmation_view.dart';
import 'package:projet_b3/Species/species_model.dart';
import 'package:projet_b3/Themes/colors.dart';
import 'package:projet_b3/Themes/custom_icons.dart';

class MarkerAddModal {
  late Species subject;
  late BuildContext context;
  final picker = ImagePicker();

  MarkerAddModal({
    required this.subject,
    required this.context,
  });

  Future<void> addMarker() async {

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

}