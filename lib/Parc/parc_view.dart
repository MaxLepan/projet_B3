import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:projet_b3/Themes/colors.dart';
import 'package:projet_b3/Themes/components.dart';

import '../Themes/app_bar.dart';
import '../Themes/unseen_icons.dart';


class ParcView extends StatelessWidget {
  const ParcView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 25),
                child: Text("PARC NATIONAL", style: textBoldStyle),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(CustomIcons.place_01, size: 32,),
                  Text(" Cévennes", style: titleStyle,)
                ],
              ),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 14, right: 14),
                        alignment: Alignment.center,
                        width: 35,
                        height: 35,
                        child : ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.asset('assets/images/logo_parc_national_cevennes.jpg'),
                        ),
                      ),
                      bubbleText(darkBeige, "Massif central"),
                      bubbleText(darkBeige, "depuis 1970"),
                    ],
                  )
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 30),
                color: darkBeige,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: iconBlock(
                    "Un statut de protection",
                    "Une réglementation spécifique* encadre la bonne pratique des activités humaines afin qu’elles aient le moins d’impacts possibles sur les milieux naturels et la biodiversité. \n \n*fixée par le décret n°2009-486 du 29 avril 2009",
                    white,
                    const Icon(CustomIcons.alert_01, size: 20,),
                  ),
                ),
              ),
              Image.asset(
                'assets/images/image_cevennes.png',
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Les règles", style: titleStyle,),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      child: Text("La réglementation est illustrée par des pictogrammes d'information et d'interdiction. ", style: textBoldStyle,),
                    ),
                    Text("Ils sont présentés à l’entrée du cœur du Parc national et sur les panneaux d’accueil au départ des sentiers de randonnée.", style: textStyle,)
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 28, right: 28, bottom: 35),
                child: Column(
                  children: [
                    blockLegend(sapin_01, "Barré de rouge : ", "interdiction stricte", strawberry_03),
                    blockLegend(sapin_01, "Barré de blanc : ", "dérogation possible", white),
                    blockLegend(sapin_01, "Vert : ", "information", sapin_01),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 28),
                color: darkBeige,
                child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text("Bonnes pratiques", style: titleStyle,),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: iconBlock(
                        "Je suis discret",
                        "Pour le confort de tous, veillez à ne pas faire trop de bruit dans les milieux naturels.",
                        white,
                        const Icon(CustomIcons.quiet_01, size: 30,),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: iconBlock(
                        "J’adopte les bons réflexes avec la faune et la flore",
                        "Nourir la faune n’est pas autorisé.\n Il est important que les animaux conservent un comportement naturel face aux humains. \n \n De plus, notre nourriture n’est souvent pas adaptée à leur métabolisme. Il est également interdit de déranger la faune qu’elle soit sauvage ou domestique.",
                        white,
                        const Icon(CustomIcons.respect_01, size: 30,),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: iconBlock(
                        "Je tiens mon chien en laisse",
                        "Pour la tranquillité de la faune sauvage et des troupeaux, la divagation des chiens est interdite.",
                        white,
                        const Icon(CustomIcons.dog_01, size: 30,),
                      ),
                    ),
                  ],
                ),

              ),
            ],
          ),
        ],
      )
    );
  }
}
