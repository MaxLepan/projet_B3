import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Icons/custom_icons.dart';
import '../filters_state.dart';

class ExpandableButton extends StatefulWidget {
  @override
  _ExpandableButtonState createState() => _ExpandableButtonState();
}

class _ExpandableButtonState extends State<ExpandableButton> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final filterState = Provider.of<FilterState>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        FloatingActionButton(
          child: const Icon(Icons.arrow_downward),
          onPressed: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
        ),
        if (isExpanded)
          Column(
            children: [
              const SizedBox(height: 10),
              ExpandedButton(
                icon: CustomIcons.spider,
                onPressed: () {},
              ),
              const SizedBox(height: 10),
              ExpandedButton(
                icon: CustomIcons.butterfly,
                onPressed: () {},
              ),
              const SizedBox(height: 10),
              ExpandedButton(
                icon: CustomIcons.snake,
                onPressed: () {
                  setState(() {
                    filterState.toggleReptileMarkers();
                  });
                },
              ),
              const SizedBox(height: 10),
              ExpandedButton(
                icon: CustomIcons.frog,
                onPressed: () {
                  setState(() {
                    filterState.toggleAmphibianMarkers();
                  });
                },
              ),
            ],
          ),
      ],
    );
  }
}

/*
class ExpandableButton extends StatefulWidget {
  const ExpandableButton({Key? key}) : super(key: key);

  @override
  _ExpandableButtonState createState() => _ExpandableButtonState();
}

class _ExpandableButtonState extends State<ExpandableButton> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: isExpanded ? 180 : 60,
          // Hauteur variable en fonction de l'état d'expansion
          child: FloatingActionButton(
            onPressed: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: const Icon(Icons.arrow_downward),
          ),
        ),
        if (isExpanded) ...[
          SizedBox(height: 10),
          ExpandedButton(icon: CustomIcons.spider),
          SizedBox(height: 10),
          ExpandedButton(icon: CustomIcons.snake),
          SizedBox(height: 10),
          ExpandedButton(icon: CustomIcons.frog),
          SizedBox(height: 10),
          ExpandedButton(icon: CustomIcons.butterfly),
        ],
      ],
    );
  }
}
*/
class ExpandedButton extends StatelessWidget {
  final IconData icon;
  final void Function()? onPressed;

  const ExpandedButton({required this.icon, Key? key, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
