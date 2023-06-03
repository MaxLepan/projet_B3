import 'package:flutter/cupertino.dart';
import 'package:projet_b3/Themes/colors.dart';

class QuestionCard extends StatelessWidget {
  final String question;
  final String imagePath;

  const QuestionCard(
      {super.key, required this.question, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: beige_03,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image(
                  image: AssetImage(imagePath),
                  fit: BoxFit.fitHeight,
                )),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              question,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 14),
        ],
      ),
    );
  }
}
