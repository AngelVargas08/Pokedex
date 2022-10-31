
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:pokedex/domain/models/pokemon.dart';
import 'package:pokedex/domain/providers/pokemon_provider.dart';
import 'package:pokedex/ui/screens/details_pokemon/widgets/widgets_details.dart';
import 'package:pokedex/ui/screens/screens.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;
import '../../utils/themes/colors_pokemon .dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Pokemon pokemon =
        ModalRoute.of(context)!.settings.arguments as Pokemon;
        

    var myfavorite = context.watch<PokemonProvider>().favoritePokemons;

    final type = pokemon.types;
    final tipo = type[0].type.name;
    final size = MediaQuery.of(context).size;
   

    return Scaffold(
        backgroundColor: colorspokemons(tipo),
        body: Column(
          children: [
            SizedBox(
              height: size.height,
              child: Stack(
                children: [

                  Positioned(
                    top: -20,
                    left: -20,
                    child: Transform.rotate(
                      angle:  -math.pi/4,
                      child: Container(
                          width: 130,
                          height: 130,
                          decoration: const BoxDecoration(
                            borderRadius:  BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20)
                                ),
                            color: Color.fromARGB(78, 255, 255, 255)
                          ),
                        ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 5, right: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              size: 25,
                              color: Colors.white,
                            )),
                        const Image(
                          image: AssetImage('assets/logo.png'),
                          width: 150,
                        ),
                        Badge(
                          position: BadgePosition.topEnd(end: 5, top: 5),
                          badgeContent: Text(
                            myfavorite.length.toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                          badgeColor: Colors.redAccent,
                          child: IconButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const FavoritesScreen(),
                                ));
                              },
                              icon: const Icon(
                                Icons.favorite,
                                size: 35,
                                color: Colors.white,
                              )),
                        ),
                      ],
                    ),
                  ),

                    

                  Positioned.fill(
                    top: 80,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              pokemon.name[0].toUpperCase() + pokemon.name.substring(1),
                              style: const TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              '#${pokemon.id}',
                              style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 60),
                          child: Row(
                            children: type.map((e) {
                              final types = e.type.name;
                              return Container(
                                decoration: BoxDecoration(
                                    color: colorstypes(types.toString()),
                                    borderRadius: BorderRadius.circular(10)),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 2),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 2),
                                child: Text(
                                  types[0].toUpperCase() + types.substring(1),
                                  
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              );
                            }).toList(),
                          ),
                        )
                      ],
                    ),
                  ),

                  
                  Positioned.fill(
                    bottom: size.height * 0.23,
                    child: const Align(
                      alignment: Alignment.center,
                      child: Rotation()
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                        color: Colors.grey[900],
                      ),
                      width: size.width,
                      height: size.height * 0.5,
                    ),
                  ),
                  Positioned.fill(
                    bottom: size.height * 0.20,
                    child: Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        child: Hero(
                          tag: pokemon.id,
                          child: FadeInImage(
                            width: size.width * 0.7,
                            placeholder: const AssetImage('assets/logo.png'),
                            image: NetworkImage(pokemon
                                .sprites.other!.officialArtwork.frontDefault
                                .toString()),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}




