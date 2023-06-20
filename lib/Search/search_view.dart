import 'package:extended_image/extended_image.dart';
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
    return Scaffold(
      appBar: const CustomLocationAppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Text(
                  "Observe autour de toi !",
                  style: titleStyle,
                ),
              ),
              const Padding(
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
                    )),
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
                      route: "/transition",
                    ),
                    SizedBox(height: 20),
                    QuestionCard(
                        question: "Quelles espèces observer dans le coin ?",
                        imagePath: 'assets/images/search_tree.png',
                        route: "/comming_soon"),
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
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.95,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 28),
                itemBuilder: (BuildContext context, int index) {
                  Species species = speciesList[index];
                  Color borderColor;

                  if (species.category.toLowerCase() == "reptile") {
                    borderColor = purple_02;
                  } else if (species.category.toLowerCase() == "amphibien") {
                    borderColor = mint_02;
                  } else if (species.category.toLowerCase() == "insecte") {
                    borderColor = orange_02;
                  } else {
                    borderColor = strawberry_02;
                  }

                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/sheet', arguments: species);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: borderColor,
                          width: 4,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        color: darkBeige,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ExtendedImage.network(
                            species.imageUrl!,
                            height: 120,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            cache: true,
                            loadStateChanged: (ExtendedImageState state) {
                              switch (state.extendedImageLoadState) {
                                case LoadState.loading:
                                  return Container(
                                    color: Colors.grey,
                                  );
                                case LoadState.completed:
                                  return null;
                                case LoadState.failed:
                                  return Container(
                                    color: Colors.redAccent,
                                  );
                              }
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 3),
                            child: Text(
                              "${species.name[0].toUpperCase()}${species.name.substring(1).toLowerCase()}",
                              style: smallTitle,
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
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
