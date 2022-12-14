
import 'package:flutter/material.dart';
import 'package:pokedex/domain/models/pokemon.dart';
import 'package:pokedex/domain/providers/pokemon_provider.dart';
import 'package:pokedex/ui/utils/themes/colors_pokemon%20.dart';
import 'package:provider/provider.dart';

class GridViewPokemonFavorites extends StatelessWidget {
  final List<Pokemon> pokemons;
  final Size size;
  const GridViewPokemonFavorites(
      {super.key, required this.pokemons, required this.size});

  @override
  Widget build(BuildContext context) {
    var myfavorite = context.watch<PokemonProvider>().favoritePokemons;
    return Expanded(
        child: GridView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.2,
      ),
      itemCount: pokemons.length,
      itemBuilder: (context, index) {
        if (index >= pokemons.length) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                CircularProgressIndicator(
                  color: Colors.purple,
                )
              ],
            ),
          );
        }
        final pokemon = pokemons[index];
        final type = pokemon.types;
        final tipo = type[0].type.name;

        return GestureDetector(
          onTap: () =>
              Navigator.pushNamed(context, 'details', arguments: pokemon),
          child: Padding(
            padding: const EdgeInsets.all(1.5),
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                color: colorspokemons(tipo.toString()),
                child: Stack(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, top: 10, right: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              pokemon.name[0].toUpperCase() +
                                  pokemon.name.substring(1),
                              style: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          Text(
                            '#${pokemon.id}',
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: type.map((e) {
                          final types = e.type.name;
                          return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: colorstypes(types),
                              ),
                              margin: const EdgeInsets.symmetric(vertical: 2),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 5),
                              child: Text(
                                types[0].toUpperCase() + types.substring(1),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13),
                              ));
                        }).toList(),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Opacity(
                        opacity: 0.5,
                        child: Image(
                          image: const AssetImage('assets/pokeball.png'),
                          width: size.width * 0.28,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Hero(
                        tag: pokemon.id,
                        child: FadeInImage(
                          placeholder: const AssetImage('assets/logo.png'),
                          image: NetworkImage(pokemon
                              .sprites.other!.officialArtwork.frontDefault
                              .toString()),
                          width: size.width * 0.27,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: IconButton(
                          onPressed: () {
                            if (!myfavorite.contains(pokemon)) {
                              context
                                  .read<PokemonProvider>()
                                  .addToFavorite(pokemon);
                            } else {
                              context
                                  .read<PokemonProvider>()
                                  .removeToFavorite(pokemon);
                            }
                          },
                          icon: Icon(
                            myfavorite.contains(pokemon)
                                ? Icons.favorite
                                : Icons.favorite_border,
                          ),
                          color: myfavorite.contains(pokemon)
                              ? Colors.white
                              : Colors.white,
                          iconSize: 30,
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        );
      },
    ));
  }
}
