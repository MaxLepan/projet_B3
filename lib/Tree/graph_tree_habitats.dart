import 'package:projet_b3/Tree/node.dart';
import 'package:projet_b3/Tree/tree.dart';

final node_environment = Node('node_environment');

final node_environment_rocky = Node('node_environment_rocky');
final node_environment_forester = Node('node_environment_forester');
final node_environment_sandy = Node('node_environment_sandy');
final node_environment_humide = Node('node_environment_humide');
final node_environment_aquatic = Node('node_environment_aquatic');
final node_environment_open = Node('node_environment_open');

final node_environment_rocky_hibernate = Node('node_environment_rocky_hibernate');
final node_environment_forester_hibernate = Node('node_environment_forester_hibernate');
final node_environment_sandy_hibernate = Node('node_environment_sandy_hibernate');
final node_environment_aquatic_hibernate = Node('node_environment_aquatic_hibernate');
final node_environment_open_hibernate = Node('node_environment_open_hibernate');
final node_environment_humide_hibernate = Node('node_environment_humide_hibernate');

final node_environment_rocky_not_hibernate = Node('node_environment_rocky_not_hibernate');
final node_environment_forester_not_hibernate = Node('node_environment_forester_not_hibernate');
final node_environment_sandy_not_hibernate = Node('node_environment_sandy_not_hibernate');
final node_environment_aquatic_not_hibernate = Node('node_environment_aquatic_not_hibernate');
final node_environment_open_not_hibernate = Node('node_environment_open_not_hibernate');
final node_environment_humide_not_hibernate = Node('node_environment_humide_not_hibernate');


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


final graph_tree_habitats = Tree({

  node_environment: [node_environment_rocky, node_environment_forester, node_environment_sandy, node_environment_aquatic, node_environment_open, node_environment_humide],

  node_environment_rocky: [node_environment_rocky_hibernate, node_environment_rocky_not_hibernate],
  node_environment_forester: [node_environment_forester_hibernate, node_environment_forester_not_hibernate],
  node_environment_sandy: [node_environment_sandy_hibernate, node_environment_sandy_not_hibernate],
  node_environment_aquatic: [node_environment_aquatic_hibernate, node_environment_aquatic_not_hibernate],
  node_environment_open: [node_environment_open_hibernate, node_environment_open_not_hibernate],
  node_environment_humide: [node_environment_humide_hibernate, node_environment_humide_not_hibernate],

  node_environment_rocky_hibernate: [leaf_pelodyte_ponctuee, leaf_triton_marbre, leaf_crapaud_accoucheur],
  node_environment_rocky_not_hibernate: [leaf_salamandre_tachetee, leaf_orvet_fragile, leaf_pelodyte_ponctuee, leaf_triton_marbre, leaf_crapaud_accoucheur],

  node_environment_forester_hibernate: [leaf_grenouille_rousse, leaf_grenouille_lessona, leaf_crapaud_epineux],
  node_environment_forester_not_hibernate: [leaf_vipere_peliade, leaf_vipere_aspic, leaf_salamandre_tachetee, leaf_grenouille_rousse, leaf_grenouille_lessona, leaf_crapaud_epineux],

  node_environment_sandy_hibernate: [leaf_crapaud_calamite],
  node_environment_sandy_not_hibernate: [leaf_crapaud_calamite],

  node_environment_aquatic_hibernate: [leaf_pelodyte_ponctuee, leaf_triton_ponctue, leaf_triton_palme, leaf_triton_crete, leaf_rainette_meridionale, leaf_grenouille_rieuse],
  node_environment_aquatic_not_hibernate: [leaf_salamandre_tachetee, leaf_pelodyte_ponctuee, leaf_triton_ponctue, leaf_triton_palme, leaf_triton_crete, leaf_rainette_meridionale, leaf_grenouille_rieuse],

  node_environment_open_hibernate: [leaf_pelodyte_ponctuee, leaf_crapaud_calamite, leaf_triton_ponctue, leaf_triton_palme, leaf_triton_marbre, leaf_triton_crete, leaf_rainette_meridionale, leaf_grenouille_rousse, leaf_grenouille_rieuse, leaf_grenouille_lessona, leaf_crapaud_epineux, leaf_crapaud_accoucheur],
  node_environment_open_not_hibernate: [leaf_vipere_peliade, leaf_vipere_aspic, leaf_salamandre_tachetee, leaf_orvet_fragile, leaf_pelodyte_ponctuee, leaf_crapaud_calamite, leaf_triton_ponctue, leaf_triton_palme, leaf_triton_marbre, leaf_triton_crete, leaf_rainette_meridionale, leaf_grenouille_rousse, leaf_grenouille_rieuse, leaf_grenouille_lessona, leaf_crapaud_epineux, leaf_crapaud_accoucheur],

  node_environment_humide_hibernate: [leaf_triton_marbre, leaf_triton_crete, leaf_grenouille_rousse],
  node_environment_humide_not_hibernate: [leaf_vipere_peliade, leaf_orvet_fragile, leaf_triton_marbre, leaf_triton_crete, leaf_grenouille_rousse],

});
