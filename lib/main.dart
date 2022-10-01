import 'package:flutter/material.dart';



import 'package:pokedex/screens/screens.dart';
import 'package:provider/provider.dart';
import 'package:pokedex/providers/pokemon_provider.dart';

void main() {
  runApp(const AppState());
}


class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> PokemonProvider(), lazy: false,)
      ],
      child: const MyApp(),
      );
  }
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

