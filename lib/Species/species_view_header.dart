import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:projet_b3/Marker/marker_add_modal.dart';
import 'package:projet_b3/Species/species_model.dart';
import 'package:projet_b3/Themes/custom_icons.dart';

import '../Marker/marker_photo_confirmation_view.dart';
import '../Themes/colors.dart';

class SpeciesViewHeader extends StatelessWidget {
  final Species subject;
  final Color mainColor;
  final Color secondaryColor;
  final picker = ImagePicker();
  final BuildContext context;

  SpeciesViewHeader(
      {super.key,
      required this.subject,
      required this.mainColor,
      required this.secondaryColor,
      required this.context});

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
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              children: [
                if(subject.precautions != null)
                  for(var precaution in subject.precautions!)
                    Container(
                      margin: const EdgeInsets.only(right: 8),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: greenBrown,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                          precaution,
                          style: textBoldStyle
                      ),
                    ),

                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                      subject.protectionStatus ?? "",
                      style: textBoldStyle
                  ),
                ),
              ],
            )
          ),
          Container(
            color: secondaryColor,
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
                        MarkerAddModal(context: context, subject: subject).addMarker();
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
        return CustomIcons.frog_01;
      case 'reptile':
        return CustomIcons.snake_01;
      case 'araignée':
        return CustomIcons.spider_01;
      default:
        return CustomIcons.insect_01;
    }
  }
}
