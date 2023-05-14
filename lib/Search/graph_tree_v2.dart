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

final node_habitat = Node(1, 'habitat');

//humide
final node_habitat_humide = Node(2, 'habitat humide');
final node_humide_espece_amphibien = Node(3, "amphibien");
final node_humide_espece_reptile = Node(4, "reptile");


//forestier
final node_habitat_forestier = Node(5, 'habitat forestier');
final node_forestier_espece_amphibien = Node(6, "amphibien");
final node_forestier_espece_reptile = Node(7, "reptile");
final node_forestier_couleur_reptile_brun = Node(8, 'brun');
final node_forestier_couleur_reptile_gris = Node(9, 'gris');
final node_forestier_couleur_amphibien_brun = Node(10, 'brun');
final node_forestier_couleur_amphibien_vert = Node(11, 'vert');


//ouvert et semi ouvert
final node_habitat_ouvert = Node(12, 'habitat ouvert semi ouvert');
final node_ouvert_couleur_amphibien_vert = Node(13, 'vert');
final node_ouvert_couleur_amphibien_brun = Node(14, 'brun');
final node_ouvert_motif_amphibien_marbre = Node(15, 'marbré');
final node_ouvert_motif_amphibien_uni = Node(16, 'uni');


//aquatique
final node_habitat_aquatique = Node(17, 'habitat aquatique');
final node_aquatique_couleur_amphibien_brun = Node(18, 'brun');
final node_aquatique_couleur_amphibien_vert = Node(19, 'vert');
final node_aquatique_motif_amphibien_brun_uni = Node(20, 'uni');
final node_aquatique_motif_amphibien_brun_marbre = Node(21, 'marbré');
final node_aquatique_motif_amphibien_vert_uni = Node(22, 'uni');
final node_aquatique_motif_amphibien_vert_tachete = Node(23, 'tacheté');


//rocheux
final node_habitat_rocheux = Node(24, 'habitat rocheux');
final node_rocheux_espece_amphibien = Node(25, "amphibien");
final node_rocheux_espece_reptile = Node(26, "reptile");
final node_rocheux_couleur_amphibien_brun = Node(27, 'brun');
final node_rocheux_couleur_amphibien_gris = Node(28, 'gris');
final node_rocheux_couleur_amphibien_vert = Node(29, 'vert');
final node_rocheux_couleur_reptile_brun = Node(30, 'brun');
final node_rocheux_couleur_reptile_vert_olive = Node(31, 'vert-olive');


//leaves
final leaf_crapaud_epineux = Node(32, "crapaud epineux");
final leaf_crapaud_calamite = Node(33, "crapaud calamite");
final leaf_pelodyte_ponctuee = Node(34, "pelodyte ponctuee");
final leaf_rainette_meridionale = Node(35, "rainette meridionale");
final leaf_couleuvre_montpellier = Node(36, "couleuvre montpellier");
final leaf_orvette_fragile = Node(37, "orvette fragile");
final leaf_grenouille_lessona = Node(38, "grenouille lessona");


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
