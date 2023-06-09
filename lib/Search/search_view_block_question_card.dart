import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet_b3/Themes/colors.dart';

class QuestionCard extends StatelessWidget {
  final String question;
  final String imagePath;
  final String route;

  const QuestionCard(
      {super.key, required this.question, required this.imagePath, required this.route});

  @override
  Widget build(BuildContext context) {
    const double size = 150;

    return Container(
      height: size,
      decoration: const BoxDecoration(
        color: beige_03,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: darkerBeige,
          foregroundColor: beige_04,
          padding: const EdgeInsets.symmetric(horizontal: 0),
          shadowColor: Colors.transparent,
        ),
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
        child: Row(
          children: [
            SizedBox(
              width: 180,
              height: size,
              child: Container(
                decoration: const BoxDecoration(
                  color: greenBrown,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(5), bottomLeft: Radius.circular(5)),
                ),
                child: ClipRRect(
                  child: Image(
                    image: AssetImage(imagePath),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child:Text(
                  question,
                  style: smallTitle,
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}
