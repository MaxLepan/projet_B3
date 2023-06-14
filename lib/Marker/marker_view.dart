import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet_b3/Species/species_view_model.dart';
import 'package:projet_b3/Themes/custom_icons.dart';
import '../Map/map_model.dart';
import '../Species/species_model.dart';
import '../Themes/colors.dart';

class MarkerView extends StatelessWidget {
  final CustomMarker marker;

  const MarkerView({Key? key, required this.marker}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IconData markerIcon;
    switch (marker.speciesCategory) {
      case 'Reptile':
        {
          markerIcon = CustomIcons.snake_01;
        }
        break;
      case 'Amphibien':
        {
          markerIcon = CustomIcons.frog_01;
        }
        break;
      case 'Insecte':
        {
          markerIcon = CustomIcons.insect_01;
        }
        break;
      default:
        markerIcon = CustomIcons.spider_01;
    }

    return FutureBuilder<Species>(
      future: SpeciesViewModel().getSpeciesByName(marker.speciesName),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return const Text(
              'Une erreur s\'est produite lors du chargement des données.');
        } else {
          Species species = snapshot.data!;

          return Container(
            child: Column(
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
                Text('La découverte de ${marker.userId}'),
              ],
            ),
          );
        }
      },
    );
  }
}
