import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet_b3/Species/species_view_model.dart';

import '../Icons/custom_icons.dart';
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
          Text(marker.speciesName,style: textStyle),
          Text('La découverte de ${marker.userId}'),

        ],
      ),
    );
  }
}
