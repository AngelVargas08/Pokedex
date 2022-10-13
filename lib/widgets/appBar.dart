// ignore: file_names



import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/themes/colors_pokemon%20.dart';

AppBar appbarPokemon() {
  
      final List<Pokemons> pokemons;
      
    return AppBar(
      iconTheme: const IconThemeData(
        color: Colors.white),
      actions: [
        IconButton(
          onPressed: (){},
           icon: const Image(image: AssetImage('assets/ball.png'),
           //width: 100,
           )
           )
      ],
      elevation: 0,
      backgroundColor:  Colors.grey[900],
      title: const Center(
        child:  Image(image: AssetImage('assets/logo.png'),
        width: 150,
        fit: BoxFit.cover,
        //alignment:  Alignment.center,
     
        ),
      ),
     );
  }