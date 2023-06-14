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

final node_species = Node(1, 'species', 'species', null);
final node_species_reptil = Node(2, 'écailleuse et sèche', 'eyelid', null);
final node_species_amphi = Node(3, 'sans écailles et humides', 'tail', null);

//Reptile
final node_rept_mobile_eyelids = Node(4, "mobiles", null, null);
final node_rept_immobile_eyelids = Node(5, "immobiles", "muzzle", null);
final node_rept_immobile_flat_muzzle = Node(6, "plat", null, null);
final node_rept_immobile_rolled_muzzle = Node(7, "retroussé", null, null);

//Amphibien
final node_amphi_flat_tail = Node(8, 'plate', 'throat', null);
final node_amphi_flat_tail_clear_throat = Node(9, 'sans taches noires', null, null);
final node_amphi_flat_tail_dark_throat = Node(10, 'taches noires', 'skin', null);
final node_amphi_flat_tail_dark_throat_marbled_skin = Node(11, 'marbrée de vert', null, null);
final node_amphi_flat_tail_dark_throat_brown_skin = Node(12, 'marron', 'spots', null);
final node_amphi_flat_tail_dark_throat_brown_skin_small_spots = Node(13, 'petites', null, null);
final node_amphi_flat_tail_dark_throat_brown_skin_big_spots = Node(14, 'grosses', null, null);

final node_amphi_rounded_tail = Node(15, 'arrondie', null, null);

final node_amphi_no_tail = Node(16, 'non existante', 'skin', null);
final node_amphi_no_tail_wart_skin = Node(17, 'verrues/pustules', 'pupil', null);
final node_amphi_no_tail_wart_skin_horizontal_pupil = Node(18, 'horizontale', 'eyes', null);
final node_amphi_no_tail_wart_skin_horizontal_pupil_red_eyes = Node(19, 'rouge, cuivré', null, null);
final node_amphi_no_tail_wart_skin_horizontal_pupil_green_eyes = Node(20, 'vert', null, null);
final node_amphi_no_tail_wart_skin_vertical_pupil = Node(21, 'verticale', 'silhouette', null);
final node_amphi_no_tail_wart_skin_vertical_pupil_thin_silhouette = Node(22, 'mince', null, null);
final node_amphi_no_tail_wart_skin_vertical_pupil_fat_silhouette = Node(23, 'trapue', null, null);

final node_amphi_no_tail_smooth_skin = Node(24, 'lisse', 'color', null);
final node_amphi_no_tail_smooth_brown_skin = Node(25, 'marron', null, null);
final node_amphi_no_tail_smooth_applegreen_skin = Node(26, 'vert pomme', null, null);
final node_amphi_no_tail_smooth_greenbrowngray_skin = Node(27, 'vert, gris, marron', 'size', null);
final node_amphi_no_tail_smooth_greenbrowngray_skin_eightcm = Node(28, '8 cm', null, null);
final node_amphi_no_tail_smooth_greenbrowngray_skin_tencm = Node(29, '10-15 cm', null, null);


final leaf_orvet_fragile = Node(30, "orvet fragile", null, null);
final leaf_vipere_peliade = Node(31, "vipère péliade", null, null);
final leaf_vipere_aspic = Node(32, "vipère aspic", null, null);
final leaf_salamandre_tachetee = Node(33, "salamandre tachetée", null, null);
final leaf_triton_marbre = Node(34, "triton marbré", null, null);
final leaf_triton_palme = Node(35, "triton palmé", null, null);
final leaf_triton_ponctue = Node(36, "triton ponctué", null, null);
final leaf_triton_crete = Node(37, "triton crêté", null, null);
final leaf_crapaud_calamite = Node(38, "crapaud calamite", null, null);
final leaf_crapaud_epineux = Node(39, "crapaud épineux", null, null);
final leaf_pelodyte_ponctuee = Node(40, "pélodyte ponctué", null, null);
final leaf_crapaud_accoucheur = Node(41, "crapaud accoucheur", null, null);
final leaf_grenouille_rousse = Node(42, "grenouille rousse", null, null);
final leaf_grenouille_rieuse = Node(43, "grenouille rieuse", null, null);
final leaf_grenouille_lessona = Node(44, "grenouille de lessona", null, null);
final leaf_rainette_meridionale = Node(45, "rainette méridionale", null, null);


final graph_tree = Graph({
  node_species: [node_species_reptil, node_species_amphi],

  //Reptile
  node_species_reptil: [node_rept_mobile_eyelids, node_rept_immobile_eyelids],
  node_rept_mobile_eyelids: [leaf_orvet_fragile],
  node_rept_immobile_eyelids: [node_rept_immobile_flat_muzzle, node_rept_immobile_rolled_muzzle],
  node_rept_immobile_flat_muzzle: [leaf_vipere_peliade],
  node_rept_immobile_rolled_muzzle: [leaf_vipere_aspic],

  //Amphibien
  node_species_amphi: [node_amphi_flat_tail, node_amphi_rounded_tail, node_amphi_no_tail],

  node_amphi_rounded_tail:[leaf_salamandre_tachetee],

  node_amphi_flat_tail:[node_amphi_flat_tail_clear_throat, node_amphi_flat_tail_dark_throat],
  node_amphi_flat_tail_clear_throat:[leaf_triton_palme],
  node_amphi_flat_tail_dark_throat: [node_amphi_flat_tail_dark_throat_marbled_skin, node_amphi_flat_tail_dark_throat_brown_skin],
  node_amphi_flat_tail_dark_throat_marbled_skin: [leaf_triton_marbre],
  node_amphi_flat_tail_dark_throat_brown_skin: [node_amphi_flat_tail_dark_throat_brown_skin_small_spots, node_amphi_flat_tail_dark_throat_brown_skin_big_spots],
  node_amphi_flat_tail_dark_throat_brown_skin_small_spots: [leaf_triton_ponctue],
  node_amphi_flat_tail_dark_throat_brown_skin_big_spots: [leaf_triton_crete],

  node_amphi_no_tail: [node_amphi_no_tail_wart_skin, node_amphi_no_tail_smooth_skin],
  node_amphi_no_tail_wart_skin: [node_amphi_no_tail_wart_skin_horizontal_pupil, node_amphi_no_tail_wart_skin_vertical_pupil],
  node_amphi_no_tail_wart_skin_horizontal_pupil:[node_amphi_no_tail_wart_skin_horizontal_pupil_red_eyes, node_amphi_no_tail_wart_skin_horizontal_pupil_green_eyes],
  node_amphi_no_tail_wart_skin_horizontal_pupil_red_eyes: [leaf_crapaud_calamite],
  node_amphi_no_tail_wart_skin_horizontal_pupil_green_eyes: [leaf_crapaud_epineux],
  node_amphi_no_tail_wart_skin_vertical_pupil:[node_amphi_no_tail_wart_skin_vertical_pupil_fat_silhouette, node_amphi_no_tail_wart_skin_vertical_pupil_thin_silhouette],
  node_amphi_no_tail_wart_skin_vertical_pupil_fat_silhouette:[leaf_crapaud_accoucheur],
  node_amphi_no_tail_wart_skin_vertical_pupil_thin_silhouette: [leaf_pelodyte_ponctuee],
  node_amphi_no_tail_smooth_skin:[node_amphi_no_tail_smooth_brown_skin, node_amphi_no_tail_smooth_greenbrowngray_skin, node_amphi_no_tail_smooth_applegreen_skin],
  node_amphi_no_tail_smooth_brown_skin:[leaf_grenouille_rousse],
  node_amphi_no_tail_smooth_applegreen_skin: [leaf_rainette_meridionale],
  node_amphi_no_tail_smooth_greenbrowngray_skin: [node_amphi_no_tail_smooth_greenbrowngray_skin_eightcm, node_amphi_no_tail_smooth_greenbrowngray_skin_tencm],
  node_amphi_no_tail_smooth_greenbrowngray_skin_eightcm: [leaf_grenouille_rieuse],
  node_amphi_no_tail_smooth_greenbrowngray_skin_tencm: [leaf_grenouille_lessona],
});