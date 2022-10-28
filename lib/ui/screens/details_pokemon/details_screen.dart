import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/domain/models/pokemon.dart';
import 'package:pokedex/domain/providers/pokemon_provider.dart';
import 'package:pokedex/ui/screens/screens.dart';
import 'package:pokedex/ui/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../../utils/themes/colors_pokemon .dart';




class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Pokemons pokemon =
        ModalRoute.of(context)!.settings.arguments as Pokemons;

        var myfavorite = context.watch<PokemonProvider>().favoritePokemons;

    final type = pokemon.type!;
    final tipo = type.first.name;
    final size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
        elevation: 0,
        backgroundColor: colorspokemons(tipo),
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
            width: double.infinity,
            decoration: BoxDecoration(color: colorspokemons(tipo)),
            child: Stack(
              children: [
                SizedBox(
                  child: Column(
                    children: [
                      const Padding(padding: EdgeInsets.only(top: 15)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            pokemon.name.toString(),
                            style: const TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            '#${pokemon.num}',
                            style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 65),
                        child: Row(
                          children: type.map((e) {
                            return Container(
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(111, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(15)),
                              margin: const EdgeInsets.symmetric(horizontal: 2),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Text(
                                e.name,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  width: size.width * 1,
                  top: size.height * 0.18,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 250,
                        child: Opacity(
                            opacity: 0.4,
                            child: Image.asset('assets/pokeball.png')),
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                    child: Container(
                        width: double.infinity,
                        height: size.height * 0.5,
                        color: Colors.grey[900],
                        child: Column(
                          children: const [
                             SizedBox(
                              height: 50,
                            ),
                            DefaultTabController(
                              length: 3,
                              child: TabPokemon()
                            )
                          ],
                        )),
                  ),
                ),
                Positioned(
                  width: size.width * 1,
                  top: size.height * 0.20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Hero(
                        tag: pokemon.id,
                        child: FadeInImage(
                          placeholder: const AssetImage('assets/logo.png'),
                          image: NetworkImage(pokemon.img.toString()),
                          width: size.width * 0.5,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}
