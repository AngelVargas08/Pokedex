

import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/providers/pokemon_provider.dart';
import 'package:pokedex/widgets/appBar.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget {
  
  const DetailsScreen({Key? key, }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    
    final Pokemons pokemon = ModalRoute.of(context)!.settings.arguments as Pokemons;  
    final size = MediaQuery.of(context).size;
   
    return  Scaffold(
      appBar: appbarPokemon(),
      body: Container(
        width: double.infinity,
        color: Colors.blueAccent,
        child: Stack(
          children: [
             SizedBox(
                  height: size.height*0.34,
                  child: Column(

                    children: [
                      const Padding(padding: EdgeInsets.only(top: 15)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(pokemon.name.toString(),
                          style: const TextStyle(
                            fontSize: 50,
                             fontWeight: FontWeight.bold, 
                             color: Colors.white),
                          ),
                          Text('#${pokemon.num}', style: const TextStyle(
                            fontSize: 30,
                             fontWeight: FontWeight.bold, 
                             color: Colors.white
                          ),)
                        ],
                      )   
                    ],
                  ),
                ),
                
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40), 
                          topRight: Radius.circular(40)),
                        child: Container(
                          width: double.infinity,
                          height: size.height*0.5,
                          color: Colors.black87,
                          child: Text('asd')
                        ),
                      ),
                    ),
                  ),
                  
                Align(
                  alignment: Alignment.center,
                  
                  child: Hero(
                   tag: pokemon.id,
                   child: FadeInImage(
                   placeholder:const AssetImage('assets/logo.png'),
                   image: NetworkImage(pokemon.img.toString(), scale: 0.4) 
                    ),
                  ),
                ),
          ],
        )
      )
    );
  }
}