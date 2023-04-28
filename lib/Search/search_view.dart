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
      body:
        const Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child:
          TextField(
            decoration: InputDecoration(
                hintText: "Trouver une bête",
                suffixIcon: IconButton(onPressed: null, icon: Icon(Icons.search))
            ),
          ),
        ),
      );
  }
}