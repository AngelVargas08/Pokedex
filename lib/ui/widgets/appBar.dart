
// ignore_for_file: unused_local_variable

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/domain/models/pokemon.dart';



AppBar appbarPokemon() {
  
      final List<Pokemon> pokemons;
      
    return AppBar(
      iconTheme: const IconThemeData(
        color: Colors.white),
      actions: [
        Badge(
              position: BadgePosition.topEnd(end: 5, top: 5),
              badgeContent:  const Text('0', 
              style: TextStyle(color: Colors.white
              ),
              ),
              badgeColor: Colors.redAccent,
              child: IconButton(
                onPressed:() {
                 
                }, 
                 icon: const Icon(
                  Icons.favorite,
                   color: Colors.grey, 
                   size: 30,)
                 ),
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