import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet_b3/Species/species_model.dart';

import '../Species/species_view_model.dart';


class SearchView extends StatefulWidget{
  const SearchView({Key? key}) : super(key: key);

  @override
  SearchViewState createState() => SearchViewState();
}

class SearchViewState extends State<SearchView> {
  final SpeciesViewModel speciesViewModel = SpeciesViewModel();
  List<Species> speciesList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("species list : ${speciesViewModel.speciesList.toString()}");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bienvenue au parc national des Cévennes"),
      ),
      body:Column(
        children:[
          // display a title in the middle of the screen
          const Padding(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Text(
              "Observe autour de toi !",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // display a subtitle in the middle of the screen
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
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child:
            TextField(
              decoration: const InputDecoration(
                hintText: "Trouver une bête",
                prefixIcon: IconButton(onPressed: null, icon: Icon(Icons.search)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                ),
              ),
              onChanged: (text) async {
                List<Species> speciesList = await speciesViewModel.getSpeciesStartingBy(text);
                setState(() {
                  this.speciesList = speciesList;
                });
              },
            ),
          ),
          SizedBox(
            height: 500,
            child: GridView.builder(
              itemCount: speciesList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                /*speciesViewModel.getSpecies().then((value) =>
                {
                  //print("value : ${value.toString()}")
                });*/
                return GestureDetector(
                  onTap: (){
                    Navigator.pushReplacementNamed(context, '/sheet', arguments: speciesList[index]);
                  },
                  child:  Image.network(
                    speciesList[index].imageUrl ?? "https://www.feteduviolon.com/wp-content/uploads/2023/02/placeholder-1.png",
                    fit: BoxFit.cover,

                  ),
                );

              },
            )
          ),
        ],
      )
    );
  }
}