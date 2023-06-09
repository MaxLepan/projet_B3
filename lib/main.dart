import 'dart:collection';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projet_b3/Icons/custom_icons.dart';
import 'package:projet_b3/Informations/informations_view.dart';
import 'package:projet_b3/Search/search_quizz_view.dart';
import 'package:projet_b3/firebase_options.dart';
import 'package:projet_b3/routes.dart';
import 'Search/search_view.dart';
import 'Home/home_view.dart';
import 'Map/map_view.dart';
import 'Themes/colors.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  const MyApp({super.key});

  @override
  MyAppState createState()=> MyAppState();
}

class MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
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
      title: 'Home Page',
      theme: ThemeData(
        primarySwatch: materialGreeBrown,
        scaffoldBackgroundColor: white,
      ),
      home: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: white,
          elevation: 10,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(CustomIcons.information02, size: 50,),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(CustomIcons.recherche02,  size: 50),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(CustomIcons.vector,  size: 30),
              label: '',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: black,
          onTap: _onItemTapped,
        ),
      ), routes: routes,
         initialRoute: '/'
    );
  }
}
