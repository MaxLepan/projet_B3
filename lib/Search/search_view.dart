import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rechercher une bête"),
      ),
      body: Center(),
    );
  }
}