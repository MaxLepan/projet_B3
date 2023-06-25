import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../Species/species_model.dart';
import '../Themes/app_bar.dart';
import '../Themes/colors.dart';
import '../Themes/custom_icons.dart';
import 'marker_view_model.dart';

class MarkerPhotoConfirmationView extends StatelessWidget {
  late File image;
  late Species species;
  final MarkerViewModel viewModel = MarkerViewModel();

  MarkerPhotoConfirmationView(
      {required this.image, required this.species, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Text("PHOTO", style: smallTitle),
            const SizedBox(height: 15),
            Text("Ta photo te plait-elle ?", style: titleStyle),
            const SizedBox(height: 30),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.file(
                image,
                fit: BoxFit.contain,
                height: 350,
                width: double.infinity,
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                viewModel
                    .uploadImage(image)
                    .then((value) => {viewModel.addMarkerToDb(value, species)});
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: materialGreeBrown.shade500,
                minimumSize: const Size.fromHeight(50),
                elevation: 0,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  children: [
                    const Icon(
                      CustomIcons.check_01,
                      color: black,
                      size: 27,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Valider",
                      style: smallTitle,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                selectNewImage(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: white,
                side: BorderSide(color: materialGreeBrown.shade500, width: 2),
                minimumSize: const Size.fromHeight(50),
                elevation: 0,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  children: [
                    const Icon(
                      CustomIcons.cross_01,
                      color: black,
                      size: 27,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "En sélectionner une nouvelle",
                      style: smallTitle,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> selectNewImage(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final newImage = File(pickedFile.path);

      image = newImage;

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => MarkerPhotoConfirmationView(
            image: image,
            species: species,
          ),
        ),
      );
    }
  }
}
