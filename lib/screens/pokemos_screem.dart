

import 'package:flutter/material.dart';
import 'package:pokedex/providers/pokemon_provider.dart';
import 'package:pokedex/widgets/widgets.dart';
import 'package:provider/provider.dart';

class PokemosScreen extends StatelessWidget {
   
  const PokemosScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    
    final pokemonProvider = context.watch<PokemonProvider>().onDisplayPokemon;

    

    final size = MediaQuery.of(context).size;

    return  Scaffold(
      backgroundColor: Colors.grey[900],
       appBar: appbarPokemon(),
      body: Container(
        padding: const  EdgeInsets.symmetric(horizontal: 8),
        child: Column( 
          
          children:  [
              const SizedBox(height: 15,),
                GridViewPokemon(size: size, 
                pokemons: pokemonProvider,
                
                ) 
          
          ],
        
        ),
      )
    );
  }

  
}

