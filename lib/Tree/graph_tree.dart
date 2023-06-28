import 'package:projet_b3/Tree/node.dart';
import 'package:projet_b3/Tree/tree.dart';

final node_species = Node('node_species');
final node_species_reptil = Node('node_species_reptil');
final node_species_amphi = Node('node_species_amphi');

//Reptile
final node_rept_mobile_eyelids = Node('node_rept_mobile_eyelids');
final node_rept_immobile_eyelids = Node('node_rept_immobile_eyelids');
final node_rept_immobile_flat_muzzle = Node('node_rept_immobile_flat_muzzle');
final node_rept_immobile_rolled_muzzle = Node('node_rept_immobile_rolled_muzzle');

//Amphibien
final node_amphi_flat_tail = Node('node_amphi_flat_tail');
final node_amphi_flat_tail_clear_throat = Node('node_amphi_flat_tail_clear_throat');
final node_amphi_flat_tail_dark_throat = Node('node_amphi_flat_tail_dark_throat');
final node_amphi_flat_tail_dark_throat_marbled_skin = Node('node_amphi_flat_tail_dark_throat_marbled_skin');
final node_amphi_flat_tail_dark_throat_brown_skin = Node('node_amphi_flat_tail_dark_throat_brown_skin');
final node_amphi_flat_tail_dark_throat_brown_skin_small_spots = Node('node_amphi_flat_tail_dark_throat_brown_skin_small_spots');
final node_amphi_flat_tail_dark_throat_brown_skin_big_spots = Node('node_amphi_flat_tail_dark_throat_brown_skin_big_spots');

final node_amphi_rounded_tail = Node('node_amphi_rounded_tail');

final node_amphi_no_tail = Node('node_amphi_no_tail');
final node_amphi_no_tail_wart_skin = Node('node_amphi_no_tail_wart_skin');
final node_amphi_no_tail_wart_skin_horizontal_pupil = Node('node_amphi_no_tail_wart_skin_horizontal_pupil');
final node_amphi_no_tail_wart_skin_horizontal_pupil_red_eyes = Node('node_amphi_no_tail_wart_skin_horizontal_pupil_red_eyes');
final node_amphi_no_tail_wart_skin_horizontal_pupil_green_eyes = Node('node_amphi_no_tail_wart_skin_horizontal_pupil_green_eyes');
final node_amphi_no_tail_wart_skin_vertical_pupil = Node('node_amphi_no_tail_wart_skin_vertical_pupil');
final node_amphi_no_tail_wart_skin_vertical_pupil_thin_silhouette = Node('node_amphi_no_tail_wart_skin_vertical_pupil_thin_silhouette');
final node_amphi_no_tail_wart_skin_vertical_pupil_fat_silhouette = Node('node_amphi_no_tail_wart_skin_vertical_pupil_fat_silhouette');

final node_amphi_no_tail_smooth_skin = Node('node_amphi_no_tail_smooth_skin');
final node_amphi_no_tail_smooth_brown_skin = Node('node_amphi_no_tail_smooth_brown_skin');
final node_amphi_no_tail_smooth_applegreen_skin = Node('node_amphi_no_tail_smooth_applegreen_skin');
final node_amphi_no_tail_smooth_greenbrowngray_skin = Node('node_amphi_no_tail_smooth_greenbrowngray_skin');
final node_amphi_no_tail_smooth_greenbrowngray_skin_eightcm = Node('node_amphi_no_tail_smooth_greenbrowngray_skin_eightcm');
final node_amphi_no_tail_smooth_greenbrowngray_skin_tencm = Node('node_amphi_no_tail_smooth_greenbrowngray_skin_tencm');


final leaf_orvet_fragile = Node('leaf_orvet_fragile');
final leaf_vipere_peliade = Node('leaf_vipere_peliade');
final leaf_vipere_aspic = Node('leaf_vipere_aspic');
final leaf_salamandre_tachetee = Node('leaf_salamandre_tachetee');
final leaf_triton_marbre = Node('leaf_triton_marbre');
final leaf_triton_palme = Node('leaf_triton_palme');
final leaf_triton_ponctue = Node('leaf_triton_ponctue');
final leaf_triton_crete = Node('leaf_triton_crete');
final leaf_crapaud_calamite = Node('leaf_crapaud_calamite');
final leaf_crapaud_epineux = Node('leaf_crapaud_epineux');
final leaf_pelodyte_ponctuee = Node('leaf_pelodyte_ponctuee');
final leaf_crapaud_accoucheur = Node('leaf_crapaud_accoucheur');
final leaf_grenouille_rousse = Node('leaf_grenouille_rousse');
final leaf_grenouille_rieuse = Node('leaf_grenouille_rieuse');
final leaf_grenouille_lessona = Node('leaf_grenouille_lessona');
final leaf_rainette_meridionale = Node('leaf_rainette_meridionale');


final graph_tree = Tree({
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
  node_amphi_no_tail_wart_skin_horizontal_pupil_red_eyes: [leaf_crapaud_epineux],
  node_amphi_no_tail_wart_skin_horizontal_pupil_green_eyes: [leaf_crapaud_calamite],
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