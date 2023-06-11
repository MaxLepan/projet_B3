import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet_b3/Species/species_model.dart';
import 'package:projet_b3/Species/species_view.dart';
import 'package:projet_b3/Species/species_view_model.dart';

import '../Icons/custom_icons.dart';
import '../Map/map_model.dart';
import '../Map/map_view.dart';
import '../Themes/colors.dart';

class MarkerView extends StatelessWidget {
  final CustomMarker marker;
  final BuildContext context;

  const MarkerView({Key? key, required this.marker, required this.context}) : super(key: key);

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
                Container(
                  height: 500,
                  child: ExtendedImage.network(
                    marker.image,
                    fit: BoxFit.cover,
                  ),
                ),
                Icon(markerIcon),
                Text(marker.speciesName, style: textStyle),
                Text('La découverte de ${marker.userId}', style: textStyle),
                ElevatedButton(
                  onPressed: () {
                    /*Navigator.pushReplacementNamed(context, '/sheet',
                          arguments: species);*/
                    Navigator.of(this.context).pushReplacement(
                      MaterialPageRoute(
                        builder: (ctx) => SpeciesView(species),
                      ),
                    );
                  },
                  child: const Text('Découvrir l\'espèce'),
                ),
                // Make a return button
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    /*Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (ctx) => const MapView(),
                        ),
                      );*/
                  },
                  child: const Text('Retour'),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
