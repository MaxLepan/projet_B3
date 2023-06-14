import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Themes/colors.dart';
import '../Themes/custom_icons.dart';
import '../filters_state.dart';

class ExpandableButton extends StatefulWidget {
  const ExpandableButton({super.key});

  @override
  _ExpandableButtonState createState() => _ExpandableButtonState();
}

class _ExpandableButtonState extends State<ExpandableButton> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final filterState = Provider.of<FilterState>(context);

    return Container(
        decoration: const BoxDecoration(
          color: beigeTransparent,
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        padding: const EdgeInsets.all(4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (isExpanded)
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ExpandedButton(
                    text: "Amphibiens",
                    icon: CustomIcons.frog_01,
                    onPressed: () {
                      setState(() {
                        filterState.toggleAmphibianMarkers();
                      });
                    },
                    backgroundColor: mint_01,
                    borderColor:
                        filterState.showAmphibianMarkers ? mint_02 : beige,
                  ),
                  const SizedBox(height: 10),
                  ExpandedButton(
                    text: "Insectes",
                    icon: CustomIcons.insect_01,
                    onPressed: () {},
                    backgroundColor: orange_01,
                    borderColor: beige,
                  ),
                  const SizedBox(height: 10),
                  ExpandedButton(
                    text: "Reptiles",
                    icon: CustomIcons.snake_01,
                    onPressed: () {
                      setState(() {
                        filterState.toggleReptileMarkers();
                      });
                    },
                    backgroundColor: purple_01,
                    borderColor:
                        filterState.showReptileMarkers ? purple_02 : beige,
                  ),
                  const SizedBox(height: 10),
                  ExpandedButton(
                    text: "Araignées",
                    icon: CustomIcons.spider_01,
                    onPressed: () {},
                    backgroundColor: strawberry_01,
                    borderColor: beige,
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            FloatingActionButton(
              heroTag: null,
              backgroundColor: beige,
              foregroundColor: black,
              elevation: 0,
              child: isExpanded
                  ? const Icon(Icons.arrow_upward)
                  : const Icon(Icons.arrow_downward),
              onPressed: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
            ),
          ],
        ));
  }
}

class ExpandedButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function()? onPressed;
  final Color backgroundColor;
  final Color borderColor;

  const ExpandedButton({
    required this.text,
    required this.icon,
    Key? key,
    required this.onPressed,
    required this.backgroundColor,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*return Row(
      children: [
        Text(text, style: textStyle),
        const SizedBox(width: 10),
        FloatingActionButton(
          onPressed: onPressed,
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
            side: BorderSide(width: 4, color: borderColor),
          ),
          child: Icon(icon, color: black),
        )
      ],
    );*/
    return FloatingActionButton(
      heroTag: null,
      onPressed: onPressed,
      backgroundColor: beige,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
        side: BorderSide(width: 4, color: borderColor),
      ),
      child: Icon(icon, color: black),
    );
  }
}
