import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: ElevatedButton(
          // Naviguer vers la route nommée "second"
          onPressed: () {
            Navigator.pushNamed(context, 'map');
          },
          child: Text("Map"),
        ),
      ),
    );
  }
}