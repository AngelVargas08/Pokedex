import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/domain/models/pokemon.dart';

class PokemonProvider extends ChangeNotifier {
  final String _baseUrl = 'https://pokeapi.co/api/v2/pokemon/';

  List<Pokemon> onDisplayPokemon = [];
  List<Pokemon> _favoritePokemos = [];

  int initial = 16;
  int i = 0;
  int x = 0;
  List<Pokemon> get favoritePokemons => _favoritePokemos;
  bool _isloading = false;
  bool get isloading => _isloading;
  bool isloadinPagination = false;
  int totalpages = 0;
  int currentPage = 0;


  PokemonProvider() {
    getDisplayPokemon();
  }

  Future<String> getJsonData(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "Error";
    }
  }

  getDisplayPokemon() async {
    ///added x pokemons to the list

    for (i; i < initial; i++) {
      final String jsonData = await getJsonData('$_baseUrl${i + 1}');
      x = i + 1;
      onDisplayPokemon.add(Pokemon.fromJson(jsonData));
      notifyListeners();
    }
    i = x;
    _isloading = true;
    totalpages = 5;
    currentPage = 1;
    isloadinPagination = currentPage < totalpages;
    notifyListeners();
  }

  void addPokemonList() async {
   // initial += 16;
    getDisplayPokemon();
    notifyListeners();
  }

  void addToFavorite(Pokemon pokemons) async {
    _favoritePokemos.add(pokemons);
    notifyListeners();
  }

  void removeToFavorite(Pokemon pokemons) async {
    _favoritePokemos.remove(pokemons);
    notifyListeners();
  }
}
