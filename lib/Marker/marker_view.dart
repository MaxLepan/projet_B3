import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projet_b3/Species/species_model.dart';
import 'package:projet_b3/Species/species_view.dart';
import 'package:projet_b3/Species/species_view_model.dart';

import '../Map/map_model.dart';
import '../Themes/colors.dart';
import '../Themes/custom_icons.dart';

class MarkerView extends StatelessWidget {
  final CustomMarker marker;
  final BuildContext context;

  const MarkerView({Key? key, required this.marker, required this.context})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    IconData markerIcon;
    Color markerColor;
    switch (marker.speciesCategory) {
      case 'Reptile':
        {
          markerIcon = CustomIcons.snake_01;
          markerColor = purple_02;
        }
        break;
      case 'Amphibien':
        {
          markerIcon = CustomIcons.frog_01;
          markerColor = mint_02;
        }
        break;
      case 'Insecte':
        {
          markerIcon = CustomIcons.insect_01;
          markerColor = orange_02;
        }
        break;
      default:
        markerIcon = CustomIcons.spider_01;
        markerColor = strawberry_02;
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
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 520,
                      child: ExtendedImage.network(
                        marker.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 480,
                      left: MediaQuery.of(context).size.width - 100,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            color: markerColor,
                            width: 4,
                          )
                        ),
                        child: Icon(
                          markerIcon,
                          color: black,
                          size: 50,
                        )
                      )
                    )
                  ],
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 35,
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
                              const Icon(CustomIcons.left_01, size: 35),
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
