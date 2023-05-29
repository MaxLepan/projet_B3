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

  final List<String> speciesImages = [
    "https://cdn.vox-cdn.com/thumbor/Lqw4lEEh11oLoXJdJv34A-5NI4s=/0x0:4928x3280/1200x0/filters:focal(0x0:4928x3280):no_upscale()/cdn.vox-cdn.com/uploads/chorus_asset/file/23286183/GettyImages_1238172363.jpg",
    "https://images.ctfassets.net/cnu0m8re1exe/jIodPqeb9lDZW6WaerUCq/a07e6130fe401e714ed8521a818be880/shutterstock_2120543582.jpg",
    "https://cdn.britannica.com/22/152822-050-FF5E5F25/Ladybug.jpg",
    "https://cff2.earth.com/uploads/2022/05/06093825/Flying-insects2-960x640.png",
    "https://cdn.theatlantic.com/thumbor/B9Zqh1ap5jlJ3wFUS9LZ-Ha6etA=/0x880:4450x3383/1600x900/media/img/mt/2019/02/GettyImages_692182998/original.jpg",
    "https://www.agproud.com/ext/resources/2022/09/12/55907-stokes-bugs.jpg?t=1663279700&width=1080",
    "https://modernfarmer.com/wp-content/uploads/2015/06/PrayingMantis-1200x704.jpg"
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("species list : ${speciesViewModel.speciesList.toString()}");
    return Scaffold(
      appBar: AppBar(
        title: Text("Rechercher une bête"),
      ),
      body:Column(
        children:[
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child:
            TextField(
              decoration: const InputDecoration(
                hintText: "Trouver une bête",
                suffixIcon: IconButton(onPressed: null, icon: Icon(Icons.search)),
              ),
              onChanged: (text) async {
                List<Species> speciesList = await speciesViewModel.getSpeciesByName(text);
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
                    print('clicked on ${speciesList[index].name}');
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