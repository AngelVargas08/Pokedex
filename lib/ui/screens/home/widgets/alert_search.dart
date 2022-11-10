import 'package:flutter/material.dart';
import 'package:pokedex/domain/models/pokemon.dart';
import 'package:pokedex/domain/providers/pokemon_provider.dart';
import 'package:provider/provider.dart';



Future<void> searchAlert(BuildContext context) async {

  final pokemons = context.read<PokemonProvider>().onDisplayPokemon;
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          content: SizedBox(
            width: 400,
            height: 500,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children:  [
                const  TextField(
                  
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide(color: Colors.blue, width: 1)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide(color: Colors.black, width: 1)),
                    prefixIcon: Icon(
                      Icons.search,
                      size: 35,
                      color: Colors.grey,
                    ),
                    suffixIcon: Icon(
                      Icons.mic,
                      size: 35,
                      color: Colors.grey,
                    ),
                    filled: true,
                    labelText: 'Search pokemons, items etc',
                    labelStyle: TextStyle(color: Colors.grey),
                  ),
                ),
                Expanded(
                  child: 
                    Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: pokemons.length,
                      itemBuilder: (context, index) {
                        Pokemon pokemo = pokemons[index];
                        //final tipo = type.first.name;
                        return Card(
                        
                        color: Colors.blueAccent,
                        elevation: 1,
                        child: ListTile(
                          leading: FadeInImage(
                            placeholder: const AssetImage('assets/logo.png'), 
                            image: NetworkImage(pokemo.sprites.other!.officialArtwork.frontDefault.toString(),scale: 0.1)
                            ),
                            trailing: Text(pokemo.id.toString()),
                          title: Text(pokemo.name.toString()),
                        ),
                      );
                      }
                      ),
                  )
                )
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancelar')),
          ],
        );
      });
}
