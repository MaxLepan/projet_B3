import 'package:projet_b3/Tree/node.dart';
import 'package:projet_b3/Tree/tree.dart';

final node_environment = Node(1, 'environment', 'environment', null);

final node_environment_rocky = Node(2, 'Rocheux', 'hibernate', null);
final node_environment_forester= Node(3, 'Forestier', 'hibernate', null);
final node_environment_sandy = Node(4, 'Sableux', 'hibernate', null);
final node_environment_humide = Node(5, 'Humide', 'hibernate', null);
final node_environment_aquatic = Node(5, 'Auqatique', 'hibernate', null);
final node_environment_open = Node(6, 'Ouvert', 'hibernate', null);

final node_environment_rocky_hibernate = Node(7, 'En hiver ou presque, entre octobre et avril', null, null);
final node_environment_forester_hibernate = Node(8, 'En hiver ou presque, entre octobre et avril', null, null);
final node_environment_sandy_hibernate = Node(9, 'En hiver ou presque, entre octobre et avril', null, null);
final node_environment_aquatic_hibernate = Node(10, 'En hiver ou presque, entre octobre et avril', null, null);
final node_environment_open_hibernate = Node(11, 'En hiver ou presque, entre octobre et avril', null, null);
final node_environment_humide_hibernate = Node(10, 'En hiver ou presque, entre octobre et avril', null, null);

final node_environment_rocky_not_hibernate = Node(28, 'Une autre saison, entre avril et octobre', null, null);
final node_environment_forester_not_hibernate = Node(29, 'Une autre saison, entre avril et octobre', null, null);
final node_environment_sandy_not_hibernate = Node(30, 'Une autre saison, entre avril et octobre', null, null);
final node_environment_aquatic_not_hibernate = Node(31, 'Une autre saison, entre avril et octobre', null, null);
final node_environment_open_not_hibernate = Node(32, 'Une autre saison, entre avril et octobre', null, null);
final node_environment_humide_not_hibernate = Node(33, 'Une autre saison, entre avril et octobre', null, null);

final leaf_orvet_fragile = Node(12, "orvet fragile", null, null);
final leaf_vipere_peliade = Node(13, "vipère péliade", null, null);
final leaf_vipere_aspic = Node(14, "vipère aspic", null, null);
final leaf_salamandre_tachetee = Node(15, "salamandre tâchetée", null, null);
final leaf_triton_marbre = Node(16, "triton marbré", null, null);
final leaf_triton_palme = Node(17, "triton palmé", null, null);
final leaf_triton_ponctue = Node(18, "triton ponctué", null, null);
final leaf_triton_crete = Node(19, "triton crêté", null, null);
final leaf_crapaud_calamite = Node(20, "crapaud calamite", null, null);
final leaf_crapaud_epineux = Node(21, "crapaud épineux", null, null);
final leaf_pelodyte_ponctuee = Node(22, "pélodyte ponctué", null, null);
final leaf_crapaud_accoucheur = Node(23, "crapaud accoucheur", null, null);
final leaf_grenouille_rousse = Node(24, "grenouille rousse", null, null);
final leaf_grenouille_rieuse = Node(25, "grenouille rieuse", null, null);
final leaf_grenouille_lessona = Node(26, "grenouille de lessona", null, null);
final leaf_rainette_meridionale = Node(27, "rainette méridionale", null, null);


final graph_tree_habitats = Tree({

  node_environment: [node_environment_rocky, node_environment_forester, node_environment_sandy, node_environment_aquatic, node_environment_open, node_environment_humide],

  node_environment_rocky: [node_environment_rocky_hibernate, node_environment_rocky_not_hibernate],
  node_environment_forester: [node_environment_forester_hibernate, node_environment_forester_not_hibernate],
  node_environment_sandy: [node_environment_sandy_hibernate, node_environment_sandy_not_hibernate],
  node_environment_aquatic: [node_environment_aquatic_hibernate, node_environment_aquatic_not_hibernate],
  node_environment_open: [node_environment_open_hibernate, node_environment_open_not_hibernate],
  node_environment_humide: [node_environment_humide_hibernate, node_environment_humide_not_hibernate],

  node_environment_rocky_hibernate: [leaf_pelodyte_ponctuee, leaf_triton_marbre, leaf_crapaud_accoucheur],
  node_environment_rocky_not_hibernate: [leaf_salamandre_tachetee, leaf_orvet_fragile],

  node_environment_forester_hibernate: [leaf_grenouille_rousse, leaf_grenouille_lessona, leaf_crapaud_epineux],
  node_environment_forester_not_hibernate: [leaf_vipere_peliade, leaf_vipere_aspic, leaf_salamandre_tachetee],

  node_environment_sandy_hibernate: [leaf_crapaud_calamite],
  node_environment_sandy_not_hibernate: [],

  node_environment_aquatic_hibernate: [leaf_pelodyte_ponctuee, leaf_triton_ponctue, leaf_triton_palme, leaf_triton_crete, leaf_rainette_meridionale, leaf_grenouille_rieuse],
  node_environment_aquatic_not_hibernate: [leaf_salamandre_tachetee],

  node_environment_open_hibernate: [leaf_pelodyte_ponctuee, leaf_crapaud_calamite, leaf_triton_ponctue, leaf_triton_palme, leaf_triton_marbre, leaf_triton_crete, leaf_rainette_meridionale, leaf_grenouille_rousse, leaf_grenouille_rieuse, leaf_grenouille_lessona, leaf_crapaud_epineux, leaf_crapaud_accoucheur],
  node_environment_open_not_hibernate: [leaf_vipere_peliade, leaf_vipere_aspic, leaf_salamandre_tachetee, leaf_orvet_fragile],

  node_environment_humide_hibernate: [leaf_triton_marbre, leaf_triton_crete, leaf_grenouille_rousse],
  node_environment_humide_not_hibernate: [leaf_vipere_peliade, leaf_orvet_fragile],

});