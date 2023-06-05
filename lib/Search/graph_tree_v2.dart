import 'dart:ffi';

class Graph {
  final Map<Node, List<Node>> nodes;

  Graph(this.nodes);
}

class Node {
  final int id;
  final String data;
  final String? questionKey;
  final String? image;

  Node(this.id, this.data, this.questionKey, this.image);

  @override
  bool operator ==(Object other) => other is Node && other.id == id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => '<$id -> $data>';
}

final node_habitat = Node(1, 'habitat', 'habitat', null);

//humide
final node_habitat_humide = Node(2, 'habitat humide', 'espece', 'https://firebasestorage.googleapis.com/v0/b/appb3projet.appspot.com/o/images%2Fquizz%2Fhabitat_humide.webp?alt=media&token=b2d6bac2-d8de-4f35-81c3-f7783d5957a3');
final node_humide_espece_amphibien = Node(3, 'non', null, null);
final node_humide_espece_reptile = Node(4, "oui", null, null);


//forestier
final node_habitat_forestier = Node(5, 'habitat forestier', 'espece', 'https://firebasestorage.googleapis.com/v0/b/appb3projet.appspot.com/o/images%2Fquizz%2Fhabitat_forestier.webp?alt=media&token=62a95604-f5f6-44e8-b793-164dfda222be');
final node_forestier_espece_amphibien = Node(6, 'non', 'couleur', null);
final node_forestier_espece_reptile = Node(7, 'oui', 'couleur', null);
final node_forestier_couleur_reptile_brun = Node(8, 'brun', null, null);
final node_forestier_couleur_reptile_gris = Node(9, 'gris', null, null);
final node_forestier_couleur_amphibien_brun = Node(10, 'brun', null, null);
final node_forestier_couleur_amphibien_vert = Node(11, 'vert', null, null);


//ouvert et semi ouvert
final node_habitat_ouvert = Node(12, 'habitat ouvert semi ouvert', 'couleur', 'https://firebasestorage.googleapis.com/v0/b/appb3projet.appspot.com/o/images%2Fquizz%2Fhabitat_ouvert.jpg?alt=media&token=6f6833d2-0d34-4bec-b664-33f9dcef2bf4');
final node_ouvert_couleur_amphibien_vert = Node(13, 'vert', null, null);
final node_ouvert_couleur_amphibien_brun = Node(14, 'brun', 'motif', null);
final node_ouvert_motif_amphibien_marbre = Node(15, 'marbré', null, null);
final node_ouvert_motif_amphibien_uni = Node(16, 'uni', null, null);


//aquatique
final node_habitat_aquatique = Node(17, 'habitat aquatique', 'couleur', 'https://firebasestorage.googleapis.com/v0/b/appb3projet.appspot.com/o/images%2Fquizz%2Fhabitat_aquatique.webp?alt=media&token=ed96e0f9-49b0-4ddd-815d-62e47b0c9d7a');
final node_aquatique_couleur_amphibien_brun = Node(18, 'brun', 'motif', null);
final node_aquatique_couleur_amphibien_vert = Node(19, 'vert', 'motif', null);
final node_aquatique_motif_amphibien_brun_uni = Node(20, 'uni', null, null);
final node_aquatique_motif_amphibien_brun_marbre = Node(21, 'marbré', null, null);
final node_aquatique_motif_amphibien_vert_uni = Node(22, 'uni', null, null);
final node_aquatique_motif_amphibien_vert_tachete = Node(23, 'tacheté', null, null);


//rocheux
final node_habitat_rocheux = Node(24, 'habitat rocheux', 'espece', 'https://firebasestorage.googleapis.com/v0/b/appb3projet.appspot.com/o/images%2Fquizz%2Fhabitat_rocheux.jpeg?alt=media&token=90dcf87c-f975-4fb9-acf3-6fc99b7cd00d');
final node_rocheux_espece_amphibien = Node(25, 'non', 'couleur', null);
final node_rocheux_espece_reptile = Node(26, "oui", 'couleur', null);
final node_rocheux_couleur_amphibien_brun = Node(27, 'brun', null, null);
final node_rocheux_couleur_amphibien_gris = Node(28, 'gris', null, null);
final node_rocheux_couleur_amphibien_vert = Node(29, 'vert', null, null);
final node_rocheux_couleur_reptile_brun = Node(30, 'brun', null, null);
final node_rocheux_couleur_reptile_vert_olive = Node(31, 'vert-olive', null, null);


//leaves
final leaf_crapaud_epineux = Node(32, "crapaud épineux", null, null);
final leaf_crapaud_calamite = Node(33, "crapaud accoucheur", null, null);
final leaf_pelodyte_ponctuee = Node(34, "pélodyte ponctué", null, null);
final leaf_rainette_meridionale = Node(35, "rainette méridionale", null, null);
final leaf_couleuvre_montpellier = Node(36, "couleuvre vipérine", null, null);
final leaf_orvette_fragile = Node(37, "vipère aspic", null, null);
final leaf_grenouille_lessona = Node(38, "grenouille de lessona", null, null);


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
