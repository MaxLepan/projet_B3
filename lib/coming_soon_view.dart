import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:projet_b3/Themes/custom_icons.dart';
import 'package:projet_b3/Themes/colors.dart';

import 'Themes/app_bar.dart';


class ComingSoonView extends StatelessWidget {
  const ComingSoonView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: Svg("assets/images/wave.svg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("BIENTOT", style: textBoldStyle),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: Text("Cette fonctionalité n'est pas encore disponible ;)", style: bigTitleStyle, textAlign: TextAlign.center,),
            ),
            Center(
              child: Container(
                width: 75,
                height: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: greenBrown_02,
                ),
                child: CustomIcons.infoShadow,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
