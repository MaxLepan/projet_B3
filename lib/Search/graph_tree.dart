import 'dart:ffi';

import 'package:graph_collection/graph.dart';

UndirectedValueGraph graphBuilder(){
  final g = UndirectedValueGraph();

  //Global Node
  g.add("habitat");

  //Humide Nodes
  g.add("espece_humide");
  g.add("couleur_humide_amphi");
  g.add("couleur_humide_rept");
  //Humide Edges
  g.set("habitat", "espece_humide", 1, "humide");
  g.set("espece_humide", "couleur_humide_amphi", 2, "amphi");
  g.set("espece_humide", "couleur_humide_rept", 3, "rept");
  g.set("couleur_humide_rept", "rainette_meridionale", 4, "vert");
  g.set("couleur_humide_amphi", "crapaud_epineux", 5, "brun");


  //Aquatique Nodes
  g.add("espece_aquatique");
  g.add("couleur_aquatique_amphi");
  g.add("motif_aquatique_amphi_brun");
  g.add("motif_aquatique_amphi_vert");
  //Aquatique Edges
  g.set("habitat", "espece_aquatique", 6, "aquatique");
  g.set("espece_aquatique", "couleur_aquatique_amphi", 7, "amphi");
  g.set("couleur_aquatique_amphi", "motif_aquatique_amphi_brun", 8, "brun");
  g.set("couleur_aquatique_amphi", "motif_aquatique_amphi_vert", 9, "vert");
  g.set("motif_aquatique_amphi_brun", "crapaud_epineux", 10, "uni");
  g.set("motif_aquatique_amphi_brun", "crapaud_calamite", 11, "marbre");
  g.set("motif_aquatique_amphi_vert", "rainette_meridionale", 12, "uni");
  g.set("motif_aquatique_amphi_vert", "grenouille_lessona", 13, "tachete");


  //Forestier Nodes
  g.add("espece_forestiers");
  g.add("couleur_forestiers_amphi");
  g.add("couleur_forestiers_rept");
  //Forestier Edges
  g.set("habitat", "espece_forestiers", 14, "forestier");
  g.set("espece_forestiers", "couleur_forestiers_amphi", 15, "amphi");
  g.set("espece_forestiers", "couleur_forestiers_rept", 16, "rept");
  g.set("couleur_forestiers_amphi", "crapaud_epineux", 17, "brun");
  g.set("couleur_forestiers_amphi", "rainette_meridionale", 18, "vert");
  g.set("couleur_forestiers_rept", "orvette_fragile", 19, "brun");
  g.set("couleur_forestiers_rept", "orvette_fragile", 20, "gris");


  //Rocheux et souterrains Nodes
  g.add("espece_rocheux_souterrains");
  g.add("couleur_rocheux_souterrains_amphi");
  g.add("couleur_rocheux_souterrains_rept");
  //Rocheux et souterrains Edges
  g.set("habitat", "espece_rocheux_souterrains", 21, "rocheux_souterrains");
  g.set("espece_rocheux_souterrains", "couleur_rocheux_souterrains_amphi", 22, "amphi");
  g.set("espece_rocheux_souterrains", "couleur_rocheux_souterrains_rept", 23, "rept");
  g.set("couleur_rocheux_souterrains_amphi", "crapaud_epineux", 24, "brun");
  g.set("couleur_rocheux_souterrains_amphi", "pelodyte_ponctuee", 25, "gris");
  g.set("couleur_rocheux_souterrains_rept", "rainette_meridionale", 26, "vert");
  g.set("couleur_rocheux_souterrains_rept", "couleuvre_montpellier", 27, "vert-olive");
  g.set("couleur_rocheux_souterrains_rept", "couleuvre_montpellier", 28, "brun");


  //Ouvert et semi ouvert Nodes
  g.add("espece_ouvert_semi");
  g.add("couleur_ouvert_semi_amphi");
  g.add("motif_ouvert_semi_amphi_brun");
  //Ouvert et semi ouvert Edges
  g.set("habitat", "espece_ouvert_semi", 29, "ouvert_semi_ouvert");
  g.set("espece_ouvert_semi", "couleur_ouvert_semi_amphi", 30, "amphi");
  g.set("couleur_ouvert_semi_amphi", "rainette_meridionale", 31, "vert");
  g.set("couleur_ouvert_semi_amphi", "motif_ouvert_semi_amphi_brun", 32, "brun");
  g.set("motif_ouvert_semi_amphi_brun", "crapaud_calamite", 33, "marbre");
  g.set("motif_ouvert_semi_amphi_brun", "crapaud_epineux", 34, "uni");


  //Leaf
  g.add("crapaud_epineux");
  g.add("crapaud_calamite");
  g.add("pelodyte_ponctuee");
  g.add("rainette_meridionale");
  g.add("couleuvre_montpellier");
  g.add("orvette_fragile");
  g.add("grenouille_lessona");

  var grapheList = g.items.toList();
  
  print("test");
  return g;
}

void main(){
  print(graphBuilder());
}