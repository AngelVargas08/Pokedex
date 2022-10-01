
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/models/pokemon.dart';

class PokemonProvider extends ChangeNotifier{
  
  String _baseUrl = 'raw.githubusercontent.com';

  List<Pokemons> onDisplayPokemon = [];

  PokemonProvider(){
    print('POkemon provider inicializado');


    this.getDisplayPokemon();
  }


  getDisplayPokemon()async{
    
    var url =
      Uri.https(_baseUrl, '/Biuni/PokemonGO-Pokedex/master/pokedex.json', );

  // Await the http get response, then decode the json-formatted response.
  final response = await http.get(url);
  final pokemonResponse = Pokemon.fromJson(response.body);
 // final Map<String, dynamic> decodedData = json.decode(response.body);

  //print(pokemonResponse.pokemon[24].img);

  onDisplayPokemon = pokemonResponse.pokemon;
  
  notifyListeners();
  }

}