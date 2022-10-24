import 'package:flutter/material.dart';
import 'package:pokedex/providers/pokemon_provider.dart';
import 'package:pokedex/themes/colors_pokemon%20.dart';
import 'package:pokedex/widgets/grid_view_pokemon.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myfavorite = context.watch<PokemonProvider>().favoritePokemons;
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
              GridViewPokemon(size: size, pokemons: myfavorite),
            ],
          ),
        )
        );
  }
}
