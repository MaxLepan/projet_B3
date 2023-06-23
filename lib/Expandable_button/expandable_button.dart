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
                    backgroundColor: filterState.showAmphibianMarkers ? mint_01 : beige,
                    borderColor:
                        filterState.showAmphibianMarkers ? mint_02 : beige_04,
                  ),
                  ExpandedButton(
                    text: "Insectes",
                    icon: CustomIcons.insect_01,
                    onPressed: () {
                      filterState.toggleInsectMarkers();
                    },
                    backgroundColor: filterState.showInsectMarkers ? orange_01 : beige,
                    borderColor: filterState.showInsectMarkers ? orange_02 : beige_04,
                  ),
                  ExpandedButton(
                    text: "Reptiles",
                    icon: CustomIcons.snake_01,
                    onPressed: () {
                      setState(() {
                        filterState.toggleReptileMarkers();
                      });
                    },
                    backgroundColor: filterState.showReptileMarkers ? purple_01 : beige,
                    borderColor:
                        filterState.showReptileMarkers ? purple_02 : beige_04,
                  ),
                  ExpandedButton(
                    text: "Araignées",
                    icon: CustomIcons.spider_01,
                    onPressed: () {
                      filterState.toggleArachnidMarkers();
                    },
                    backgroundColor: filterState.showArachnidMarkers ? strawberry_01 : beige,
                    borderColor: filterState.showArachnidMarkers ? strawberry_02 : beige_04,
                  ),
                ],
              ),
            if (filterState.showAmphibianMarkers && !isExpanded)
              ExpandedButton(
                text: "Amphibiens",
                icon: CustomIcons.frog_01,
                onPressed: () {
                  setState(() {
                    filterState.toggleAmphibianMarkers();
                  });
                },
                backgroundColor: mint_01,
                borderColor: mint_02,
              ),
            if (filterState.showInsectMarkers && !isExpanded)
              ExpandedButton(
                text: "Insectes",
                icon: CustomIcons.insect_01,
                onPressed: () {
                  filterState.toggleInsectMarkers();
                },
                backgroundColor: orange_01,
                borderColor: orange_02,
              ),
            if (filterState.showReptileMarkers && !isExpanded)
              ExpandedButton(
                text: "Reptiles",
                icon: CustomIcons.snake_01,
                onPressed: () {
                  setState(() {
                    filterState.toggleReptileMarkers();
                  });
                },
                backgroundColor: purple_01,
                borderColor: purple_02,
              ),
            if (filterState.showArachnidMarkers && !isExpanded)
              ExpandedButton(
                text: "Araignées",
                icon: CustomIcons.spider_01,
                onPressed: () {
                  filterState.toggleArachnidMarkers();
                },
                backgroundColor: strawberry_01,
                borderColor: strawberry_02,
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
        child: FloatingActionButton(
      heroTag: null,
      onPressed: onPressed,
      backgroundColor: backgroundColor,
      elevation: 0,
      focusElevation: 0,
      highlightElevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
        side: BorderSide(width: 4, color: borderColor),
      ),
      child: Icon(icon, color: black, size: 40,),
    ));
  }
}
