
import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/providers/pokemon_provider.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatelessWidget {
   
  const FavoritesScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    var myfavorite = context.watch<PokemonProvider>().favoritePokemons;

    return  Scaffold(
      body: Column(
        children: [
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5.0,
                  crossAxisSpacing: 5.0
                  ),
                  itemCount: 10, 
                itemBuilder: (context, index) {
                  Pokemons pokemon = myfavorite[index];
                  return Card(
                    color: Colors.black,
                    elevation: 1,
                    child: Column(
                        children: [
                          Text('asdas')
                        ],
                    ),
                  );
                },
                )
        ],
      )
    );
  }
}