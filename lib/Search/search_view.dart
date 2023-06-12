import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet_b3/Search/search_view_block_question_card.dart';
import 'package:projet_b3/Species/species_model.dart';
import 'package:projet_b3/Themes/app_bar.dart';

import '../Themes/colors.dart';
import '../Themes/custom_icons.dart';
import '../Species/species_view_model.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  SearchViewState createState() => SearchViewState();
}

class SearchViewState extends State<SearchView> {
  final SpeciesViewModel speciesViewModel = SpeciesViewModel();
  List<Species> speciesList = [];
  bool isSearchBarClicked = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("species list : ${speciesViewModel.speciesList.toString()}");
    return Scaffold(
      appBar: const CustomLocationAppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(children: const [
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Text(
                  "Observe autour de toi !",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  "Tu verras les petites-bêtes d’un\nnouvel œil.",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.only(left: 28, right: 28, bottom: 20),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: "Trouver une bête",
                  prefixIcon:
                  IconButton(onPressed: null, icon: Icon(Icons.search)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    borderSide: BorderSide(color: greenBrown),
                  )
                ),
                onChanged: (text) async {
                  List<Species> speciesList =
                  await speciesViewModel.getSpeciesStartingBy(text);
                  setState(() {
                    this.speciesList = speciesList;
                  });
                },
                onTap: () {
                  setState(() {
                    isSearchBarClicked = true;
                  });
                },
              ),
            ),
            Visibility(
              visible: !isSearchBarClicked,
              child: Container(
                padding: horizontalPadding,
                child: Column(
                  children: const [
                    QuestionCard(
                        question: "Quelle est cette petite bête ?",
                        imagePath: "assets/images/search_view.png",
                        route: "/transition",),
                    SizedBox(height: 20),
                    QuestionCard(
                        question: "Quelles espèces observer dans le coin ?",
                        imagePath: 'assets/images/search_tree.png',
                        route: ""),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: isSearchBarClicked,
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: speciesList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, '/sheet',
                          arguments: speciesList[index]);
                    },
                    child: Image.network(
                      speciesList[index].imageUrl ??
                          "https://www.feteduviolon.com/wp-content/uploads/2023/02/placeholder-1.png",
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
