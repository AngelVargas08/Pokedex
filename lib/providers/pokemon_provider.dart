
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/models/pokemon.dart';

class PokemonProvider extends ChangeNotifier{
  
  final String _baseUrl = 'raw.githubusercontent.com';

  List<Pokemons> onDisplayPokemon = [];

  PokemonProvider(){
    getDisplayPokemon();
  }


  getDisplayPokemon()async{
    
    var url =
      Uri.https(_baseUrl, '/Biuni/PokemonGO-Pokedex/master/pokedex.json', );


  final response = await http.get(url);
  final pokemonResponse = Pokemon.fromJson(response.body);
 

  onDisplayPokemon = pokemonResponse.pokemon;
  
  notifyListeners();
  }

}