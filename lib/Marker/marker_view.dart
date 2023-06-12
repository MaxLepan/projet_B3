import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projet_b3/Species/species_model.dart';
import 'package:projet_b3/Species/species_view.dart';
import 'package:projet_b3/Species/species_view_model.dart';

import '../Icons/custom_icons.dart';
import '../Map/map_model.dart';
import '../Themes/colors.dart';

class MarkerView extends StatelessWidget {
  final CustomMarker marker;
  final BuildContext context;

  const MarkerView({Key? key, required this.marker, required this.context})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    IconData markerIcon;
    switch (marker.speciesCategory) {
      case 'Reptile':
        {
          markerIcon = CustomIcons.snake;
        }
        break;
      case 'Amphibien':
        {
          markerIcon = CustomIcons.frog;
        }
        break;
      case 'Insecte':
        {
          markerIcon = CustomIcons.butterfly;
        }
        break;
      default:
        markerIcon = CustomIcons.spider;
    }

    return Scaffold(
      body: FutureBuilder<Species>(
        future: SpeciesViewModel().getSpeciesByName(marker.speciesName),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return const Text(
                'Une erreur s\'est produite lors du chargement des données.');
          } else {
            Species species = snapshot.data!;

            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 520,
                  child: ExtendedImage.network(
                    marker.image,
                    fit: BoxFit.cover,
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 19,
                      left: 19,
                      right: 19,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                                marker.speciesName[0].toUpperCase() +
                                    marker.speciesName.substring(1),
                                style: GoogleFonts.rubik(
                                  color: black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                )),
                            Text(
                              'Découverte d\'un Promeneur',
                              style: GoogleFonts.rubik(
                                color: black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            elevation: MaterialStateProperty.all<double>(0),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                materialGreeBrown.shade500),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(black),
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                const EdgeInsets.symmetric(vertical: 17)),
                          ),
                          onPressed: () {
                            Navigator.of(this.context).pushReplacement(
                              MaterialPageRoute(
                                builder: (ctx) => SpeciesView(species),
                              ),
                            );
                          },
                          child: Text(
                            'Découvrir l\'espèce',
                            style: GoogleFonts.rubik(
                              color: black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(black),
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                const EdgeInsets.all(0)),
                          ),
                          child: Row(
                            children: [
                              const Icon(CustomIcons.retour, size: 35),
                              Text('Retour', style: textBoldStyle),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
