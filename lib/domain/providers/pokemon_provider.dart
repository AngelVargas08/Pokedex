
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/domain/models/pokemon.dart';


class PokemonProvider extends ChangeNotifier{
  
  final String _baseUrl = 'https://pokeapi.co/api/v2/pokemon/';

  List<Pokemon> onDisplayPokemon = [];
  List<Pokemon> _favoritePokemos = [];
  List<Pokemon> get favoritePokemons => _favoritePokemos;
  bool _isloading = true;
  bool get isloading => _isloading;

        
 


  PokemonProvider(){
    getDisplayPokemon();
  }

   Future <String> getJsonData(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200){
      return response.body;
    } else {
      return "Error";
    }
  }

   getDisplayPokemon() async{
    ///added 10 pokemons to the list
    for (int i =0; i<16; i++){

      final String jsonData = await getJsonData('$_baseUrl${i+1}');
      
      onDisplayPokemon.add(Pokemon.fromJson(jsonData));
      notifyListeners();
    }

  
    _isloading = false;
    notifyListeners();
  }

  void addToFavorite(Pokemon pokemons)async{
    _favoritePokemos.add(pokemons);
    notifyListeners();
  }

  void removeToFavorite(Pokemon pokemons)async{
    _favoritePokemos.remove(pokemons);
    notifyListeners();
  }

}