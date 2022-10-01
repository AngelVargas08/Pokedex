

import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';

class GridViewPokemon extends StatelessWidget {

  final List<Pokemons> pokemons;
  final Size size;


  const GridViewPokemon({
    Key? key,
    required this.size,  
    required this.pokemons,
  }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return Expanded(
      
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.2,
          ),
        itemCount: pokemons.length, 
        itemBuilder: (context, index) {
            final pokemon = pokemons[index];
            final type = pokemons[index].type;
            final mapa = type!.asMap();
            print(mapa[0]);
           
            
          return  Padding(
            padding: const EdgeInsets.all(1.5),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
              color:   Colors.blueAccent,
              child: Stack(
                
                children:  [
                  
                  Padding(
                      padding: const EdgeInsets.only(left: 10,top: 10,right: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(pokemon.name.toString(),style:  const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                          maxLines: 2,
                          ),
                          Text('#${pokemon.num}',style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
                          ),

                        ],
                      ),
                        
                    ),

                    

                    Align(
                      
                      alignment: Alignment.centerLeft,
                      
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: 2,
                              itemBuilder: (context, index) {
                                return Container(
                                   child: Container(
                                    color: Colors.white,
                                    child: Text('Poison')),
                                );
                              }, 
                              
                               )
                             ],
                        ),
                      ),
                    ),

                    Align(
                      alignment: Alignment.bottomRight,
                      child: Opacity(
                        opacity: 0.5,
                        child: Image(
                          image: const AssetImage('assets/pokeball.png'),
                          width: size.width*0.28,
                          
                          ),
                      ),
                    ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: FadeInImage(
                      placeholder: const AssetImage('assets/logo.png'),
                      image:  NetworkImage(pokemon.img.toString()),
                      width: size.width*0.25,
                      fit: BoxFit.cover,
                      ),
                  ),
                  
                  
                ],
              )
            ),
          );

        },
        
        ),
    );
  }
}