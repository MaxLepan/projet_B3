import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projet_b3/Informations/informations_view.dart';
import 'package:projet_b3/firebase_options.dart';
import 'package:projet_b3/routes.dart';
import 'package:provider/provider.dart';
import 'Search/search_view.dart';
import 'Map/map_view.dart';
import 'Themes/app_bar.dart';
import 'Themes/colors.dart';
import 'filters_state.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
        create: (_) => FilterState(),
        child: const MyApp()
    ),
  );
}

class MyApp extends StatefulWidget{
  const MyApp({super.key});

  @override
  MyAppState createState()=> MyAppState();
}

class MyAppState extends State<MyApp> {
  int _selectedIndex = 1;
  final List<Widget> _pages = [
    InformationsView(),
    const SearchView(),
    const MapView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: materialGreeBrown,
        scaffoldBackgroundColor: white,
      ),
      home: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: MyBottomNavigationBar(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
      ), routes: routes,
         initialRoute: '/'
    );
  }
}
