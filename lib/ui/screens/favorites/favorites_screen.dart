import 'package:flutter/material.dart';
import 'package:pokedex/domain/providers/pokemon_provider.dart';
import 'package:pokedex/ui/screens/favorites/widgets/grid_view_Favorite.dart';
import 'package:provider/provider.dart';

import '../../utils/themes/colors_pokemon .dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myfavorite = context.read<PokemonProvider>().favoritePokemons;
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: ThemesPokemon.darkmode,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ThemesPokemon.darkmode,
          title: const Text(
            'Favorites',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          padding: const  EdgeInsets.symmetric(horizontal: 8,vertical: 15),
          child: Column(
            children: [
              GridViewPokemonFavorites(size: size, pokemons: myfavorite
              ),
            ],
          ),
        )
        );
  }
}
