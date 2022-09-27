import 'package:flutter/material.dart';


import 'package:pokedex/screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex',
      initialRoute: 'home',
      routes: {
        'home'    :(_) => const HomeScreen(),
        'pokemon' :(_) => const PokemosScreen(),
        'items'   :(_) => const ItemsScreen(),
        'favorite':(_) => const FavoritesScreen(),
        'moves'   :(_) => const MovesScreen(),
        'types'   :(_) => const TypesScreen(),
      },
     
    );
  }
}

