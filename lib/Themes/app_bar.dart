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
            Navigator.popUntil(context, (route) => route.isFirst);
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

class CustomAppBarCloseReturn extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBarCloseReturn({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: -10,
      leading: Container(
        margin: const EdgeInsets.only(top: 0),
        child: IconButton(
          icon: const Icon(CustomIcons.left_01, size: 25,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 18,),
          child: Row(
            children: [
              TextButton.icon(
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                label:  Text('Fermer', style: textBoldStyle),
                icon: const Icon(CustomIcons.cross_01, color: black,),
              ),
            ],
          ),
        )

      ],
      elevation: 0.0,
      iconTheme: const IconThemeData(color: black),
      backgroundColor: white,
      title: Text("Retour", style: textBoldStyle),
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
      iconTheme: const IconThemeData(color: black),
      backgroundColor: darkBeige,
      title: Text("Parc national des Cévennes", style: textBoldStyle),
    );
  }
}


class MyBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const MyBottomNavigationBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: darkerBeige, width: 3),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 18),
            child: TabBar(
              indicatorColor: black,
              indicatorWeight: 3,
              indicator: const UnderlineTabIndicator(
                insets: EdgeInsets.fromLTRB(20.0, 0.0, 25, 64.0),
                borderSide:
                BorderSide(color: black, width: 3),
              ),
              labelColor: black,
              unselectedLabelColor: black.withOpacity(0.5),
              onTap: onItemTapped,
              tabs: [
                Tab(icon: CustomIcons.glassShadow),
                Tab(icon: CustomIcons.mapShadow),
                Tab(icon: CustomIcons.infoShadow),
                Tab(icon: CustomIcons.userShadow),
              ],
              controller: DefaultTabController.of(context),
            ),
          ),
        ],
      ),
    );
  }
}
