

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/domain/providers/pokemon_provider.dart';
import 'package:pokedex/ui/screens/screens.dart';
import 'package:pokedex/ui/widgets/widgets.dart';
import 'package:provider/provider.dart';
import '../../utils/themes/colors_pokemon .dart';



class PokemosScreen extends StatelessWidget {
   
  const PokemosScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    
    var pokemonProvider = context.watch<PokemonProvider>().onDisplayPokemon;
    var myfavorite = context.watch<PokemonProvider>().favoritePokemons;
    var isloading = context.read<PokemonProvider>().isloading;

    

    final size = MediaQuery.of(context).size;

    return  Scaffold(
      backgroundColor: ThemesPokemon.darkmode,
        appBar: AppBar(
        elevation: 0,
        backgroundColor: ThemesPokemon.darkmode,
        title: const Center(
        child:  Image(image: AssetImage('assets/logo.png'),
        width: 150,
        fit: BoxFit.cover,
       
        ),
      ),
          actions: [
            Badge(
              position: BadgePosition.topEnd(end: 5, top: 5),
              badgeContent:  Text(myfavorite.length.toString(), 
              style: const TextStyle(color: Colors.white
              ),
              ),
              badgeColor: Colors.redAccent,
              child: IconButton(
                onPressed:() {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const FavoritesScreen(),));
                }, 
                 icon: const Icon(
                  Icons.favorite,
                   color: Colors.white, 
                   size: 35,)
                 ),
            )
          ],
          

      ),
      body: Container(
        padding: const  EdgeInsets.symmetric(horizontal: 8,vertical: 15),
        child: Column( 
          
          children:  [
                if(isloading == true)
                const Expanded(
                  child:SizedBox(
                  
                  height: 100,
                  child: Center(
                    child: CircularProgressIndicator(
                      
                      color: Colors.purple,
                    ),
                  ),
                ))
                
                else
                GridViewPokemon(size: size, 
                pokemons: pokemonProvider,
                
                ), 
          
          ],
        
        ),
      ), 
    );
  }

  
}

