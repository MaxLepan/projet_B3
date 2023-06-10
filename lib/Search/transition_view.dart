import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:projet_b3/Icons/custom_icons.dart';
import 'package:projet_b3/Themes/colors.dart';

import '../firebase_options.dart';
import '../routes.dart';

class TransitionView extends StatefulWidget {
  @override
  _TransitionViewState createState() => _TransitionViewState();
}

class _TransitionViewState extends State<TransitionView> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/questions');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Text("IDENTIFICATION", style: textBoldStyle),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Text("C'est parti !", style: bigTitleStyle),
            ),
            Center(
              child: Container(
                width: 75,
                height: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: greenBrown_02,
                ),
                child: const Icon(CustomIcons.recherche02, size: 70),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
