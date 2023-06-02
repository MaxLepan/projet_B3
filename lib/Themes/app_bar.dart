import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet_b3/Themes/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      leading: Container(
        margin: const EdgeInsets.only(top: 3),
        child: IconButton(
          icon: const Icon(CupertinoIcons.xmark, size: 28,),
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