import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet_b3/Themes/colors.dart';
import '../Map/map_view.dart';
import '../Informations/informations_view.dart';
import '../Search/search_view.dart';
import 'custom_icons.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: -10,
      leading: Container(
        margin: const EdgeInsets.only(top: 0),
        child: IconButton(
          icon: const Icon(CustomIcons.cross_01 , size: 25,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      elevation: 0.0,
      iconTheme: const IconThemeData(color: Colors.black),
      backgroundColor: white,
      title: const Text("Fermer", style: TextStyle(color: Colors.black, fontSize: 18)),
    );
  }
}


class CustomLocationAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomLocationAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: -10,
      leading: Container(
        margin: const EdgeInsets.only(top: 0),
        child: const Icon(CustomIcons.place_01 , size: 25,),
      ),
      elevation: 0.0,
      iconTheme: const IconThemeData(color: Colors.black),
      backgroundColor: white,
      title: Text("Parc national des Cévennes", style: textBoldStyle),
    );
  }
}


class MyBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const MyBottomNavigationBar({
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      elevation: 10,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: CustomIcons.infoShadow,
          label: '',
        ),
        BottomNavigationBarItem(
          icon: CustomIcons.glassShadow,
          label: '',
        ),
        BottomNavigationBarItem(
          icon: CustomIcons.mapShadow,
          label: '',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.black,
      onTap: onItemTapped,
    );
  }
}


