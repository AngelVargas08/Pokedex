

import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/providers/pokemon_provider.dart';
import 'package:pokedex/widgets/appBar.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget {
  
  const DetailsScreen({Key? key, }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    
    final Pokemons pokemon = ModalRoute.of(context)!.settings.arguments as Pokemons;  
    final size = MediaQuery.of(context).size;
   
    return  Scaffold(
      appBar: appbarPokemon(),
      body: Container(
        width: double.infinity,
        color: Colors.blueAccent,
        child: Column(
          children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: size.height*0.41,
                    //color: Colors.red,
                  ),

                  Hero(
                    tag: pokemon.id,
                    child: FadeInImage(
                      fit: BoxFit.contain,
                      placeholder:AssetImage('assets/logo.png'),
                       image: NetworkImage(pokemon.img.toString(),scale: 0.5) 
                       ),
                  ),
                     
                     
                ],
              ),
                
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    
                    width: double.infinity,
                    height: size.height*0.5,
                    color: Colors.black87,
                  ),
                )
          ],
        ),
      )
    );
  }
}