import 'package:graphs/graphs.dart';

class Graph {
  final Map<Node, List<Node>> nodes;

  Graph(this.nodes);
}

class Node {
  final int id;
  final String data;

  Node(this.id, this.data);

  @override
  bool operator ==(Object other) => other is Node && other.id == id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => '<$id -> $data>';
}

void main() {
  final node_habitat = Node(1, 'habitat');

  //humide
  final node_habitat_humide = Node(2, 'habitat humide');
  final node_humide_espece_amphibien = Node(3, "amphibien");
  final node_humide_espece_reptile = Node(20, "reptile");


  //forestier
  final node_habitat_forestier = Node(4, 'habitat forestier');
  final node_forestier_espece_amphibien = Node(15, "amphibien");
  final node_forestier_espece_reptile = Node(16, "reptile");
  final node_forestier_couleur_reptile_brun = Node(18, 'brun');
  final node_forestier_couleur_reptile_gris = Node(19, 'gris');
  final node_forestier_couleur_amphibien_brun = Node(18, 'brun');
  final node_forestier_couleur_amphibien_vert = Node(19, 'vert');


  //ouvert et semi ouvert
  final node_habitat_ouvert = Node(5, 'habitat ouvert semi ouvert');
  final node_ouvert_couleur_amphibien_vert = Node(22, 'vert');
  final node_ouvert_couleur_amphibien_brun = Node(23, 'brun');
  final node_ouvert_motif_amphibien_marbre = Node(24, 'marbré');
  final node_ouvert_motif_amphibien_uni = Node(25, 'uni');


  //aquatique
  final node_habitat_aquatique = Node(6, 'habitat aquatique');
  final node_aquatique_couleur_amphibien_brun = Node(26, 'brun');
  final node_aquatique_couleur_amphibien_vert = Node(27, 'vert');
  final node_aquatique_motif_amphibien_brun_uni = Node(28, 'uni');
  final node_aquatique_motif_amphibien_brun_marbre = Node(29, 'marbré');
  final node_aquatique_motif_amphibien_vert_uni = Node(30, 'uni');
  final node_aquatique_motif_amphibien_vert_tachete = Node(31, 'tacheté');


  //rocheux
  final node_habitat_rocheux = Node(7, 'habitat rocheux');
  final node_rocheux_espece_amphibien = Node(32, "amphibien");
  final node_rocheux_espece_reptile = Node(33, "reptile");
  final node_rocheux_couleur_amphibien_brun = Node(34, 'brun');
  final node_rocheux_couleur_amphibien_gris = Node(35, 'gris');
  final node_rocheux_couleur_amphibien_vert = Node(37, 'vert');
  final node_rocheux_couleur_reptile_brun = Node(36, 'brun');
  final node_rocheux_couleur_reptile_vert_olive = Node(38, 'vert-olive');


  //leaves
  final leaf_crapaud_epineux = Node(8, "crapaud epineux");
  final leaf_crapaud_calamite = Node(9, "crapaud calamite");
  final leaf_pelodyte_ponctuee = Node(10, "pelodyte ponctuee");
  final leaf_rainette_meridionale = Node(11, "rainette meridionale");
  final leaf_couleuvre_montpellier = Node(12, "couleuvre montpellier");
  final leaf_orvette_fragile = Node(13, "orvette fragile");
  final leaf_grenouille_lessona = Node(14, "grenouille lessona");


  final graph = Graph({
    node_habitat: [node_habitat_aquatique, node_habitat_forestier, node_habitat_humide, node_habitat_ouvert, node_habitat_rocheux],

    //humide edges
    node_habitat_humide: [node_humide_espece_amphibien, node_humide_espece_reptile],
    node_humide_espece_amphibien: [leaf_crapaud_epineux],
    node_humide_espece_reptile: [leaf_rainette_meridionale],

    //forestier edges
    node_habitat_forestier: [node_forestier_espece_reptile, node_forestier_espece_amphibien],
    node_forestier_espece_reptile: [node_forestier_couleur_reptile_brun, node_forestier_couleur_reptile_gris],
    node_forestier_espece_amphibien: [node_forestier_couleur_amphibien_brun, node_forestier_couleur_amphibien_vert],
    node_forestier_couleur_reptile_brun: [leaf_orvette_fragile],
    node_forestier_couleur_reptile_gris: [leaf_orvette_fragile],
    node_forestier_couleur_amphibien_brun: [leaf_crapaud_epineux],
    node_forestier_couleur_amphibien_vert: [leaf_rainette_meridionale],

    //ouvert et semi ouvert edges
    node_habitat_ouvert: [node_ouvert_couleur_amphibien_vert, node_ouvert_couleur_amphibien_brun],
    node_ouvert_couleur_amphibien_vert: [leaf_rainette_meridionale],
    node_ouvert_couleur_amphibien_brun: [node_ouvert_motif_amphibien_marbre, node_ouvert_motif_amphibien_uni],
    node_ouvert_motif_amphibien_marbre: [leaf_crapaud_calamite],
    node_ouvert_motif_amphibien_uni: [leaf_crapaud_epineux],

    //aquatique edges
    node_habitat_aquatique: [node_aquatique_couleur_amphibien_brun, node_aquatique_couleur_amphibien_vert],
    node_aquatique_couleur_amphibien_brun: [node_aquatique_motif_amphibien_brun_marbre, node_aquatique_motif_amphibien_brun_uni],
    node_aquatique_couleur_amphibien_vert: [node_aquatique_motif_amphibien_vert_uni, node_aquatique_motif_amphibien_vert_tachete],
    node_aquatique_motif_amphibien_brun_marbre: [leaf_crapaud_calamite],
    node_aquatique_motif_amphibien_brun_uni: [leaf_crapaud_epineux],
    node_aquatique_motif_amphibien_vert_uni: [leaf_rainette_meridionale],
    node_aquatique_motif_amphibien_vert_tachete: [leaf_grenouille_lessona],

    //rocheux edges
    node_habitat_rocheux: [node_rocheux_espece_amphibien, node_rocheux_espece_reptile],
    node_rocheux_espece_amphibien: [node_rocheux_couleur_amphibien_gris, node_rocheux_couleur_amphibien_brun, node_rocheux_couleur_amphibien_vert],
    node_rocheux_espece_reptile: [node_rocheux_couleur_reptile_brun, node_rocheux_couleur_reptile_vert_olive],
    node_rocheux_couleur_amphibien_gris: [leaf_pelodyte_ponctuee],
    node_rocheux_couleur_amphibien_brun: [leaf_crapaud_epineux],
    node_rocheux_couleur_amphibien_vert: [leaf_rainette_meridionale],
    node_rocheux_couleur_reptile_brun: [leaf_couleuvre_montpellier],
    node_rocheux_couleur_reptile_vert_olive: [leaf_couleuvre_montpellier],
  });

  var nodes = graph.nodes;

  for(var entry in graph.nodes.entries){
    print(entry.key);
  }
  print("test");
}