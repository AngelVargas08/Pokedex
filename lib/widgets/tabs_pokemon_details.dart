import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/themes/colors_pokemon%20.dart';

class TabPokemon extends StatelessWidget {
  const TabPokemon({super.key});

  @override
  Widget build(BuildContext context) {
    final Pokemons pokemon = ModalRoute.of(context)!.settings.arguments as Pokemons;
    final type = pokemon.weaknesses;
    final nextEvolution = pokemon.nextEvolution;
    final prevEvolution = pokemon.prevEvolution;
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        const TabBar(indicatorColor: Colors.white, tabs: [
          Tab(
            child: Text(
              'About',
              style: TxtStyles.textStyle17,
            ),
          ),
          Tab(
            child: Text(
              'Evolution',
              style: TxtStyles.textStyle17,
            ),
          ),
          Tab(
            child: Text(
              'Moves',
              style: TxtStyles.textStyle17,
            ),
          ),
        ]),
        Container(
          height: size.height * 0.38,
          decoration: const BoxDecoration(
              // color: Colors.amber,
              border: Border(top: BorderSide(color: Colors.white, width: 0.5))),
          child: TabBarView(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20 ),
                //****Tab About************************************
                //****first column************************************
                child: Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        
                        children: [
                          const Expanded(
                            child: Text(
                              'Height',
                              style: TxtStyles.textStyleGrey,
                            ),
                          ),
                
                          Expanded(
                            flex: 2,
                            child: Text(pokemon.height.toString(),
                            style: TxtStyles.textStyleWhite),
                          )
                        ],
                      ),
                
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            'Weight',
                            style: TxtStyles.textStyleGrey,
                          ),
                          Text(pokemon.weight.toString(),
                          style: TxtStyles.textStyleWhite)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            'Candy',
                            style: TxtStyles.textStyleGrey,
                          ),
                          Text(pokemon.candy.toString(),
                          style: TxtStyles.textStyleWhite),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            'Egg',
                            style: TxtStyles.textStyleGrey,
                          ),
                          Text(pokemon.egg.toString(),
                          style: TxtStyles.textStyleWhite),
                
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            'Weaknesses',
                            style: TxtStyles.textStyleGrey,
                          ),
                          Row(
                          children: type!.map((e) {
                        return FittedBox(
                          child: Text('${e.name}, ',
                              maxLines: 2, style: TxtStyles.textStyleWhite),
                        );
                      }).toList())
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 60),
                    //***********Column next/prev evolution************************************
                    //*****************first column************************************
                    child: Column(
                      children: [
                        if (nextEvolution != null && prevEvolution != null)
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Text('Prev Evolution',
                                    style: TxtStyles.textStyleGrey),
                                // SizedBox(height: 50,),
                                Text('Next Evolution',
                                    style: TxtStyles.textStyleGrey)
                              ],
                            ),
                          ),
                        if (nextEvolution == null)
                          Column(
                            children: const [
                              Text('Prev Evolution',
                                  style: TxtStyles.textStyleGrey)
                            ],
                          ),
                        if (prevEvolution == null)
                          Column(
                            children: const [
                              Text('Next Evolution',
                                  style: TxtStyles.textStyleGrey)
                            ],
                          )
                      ],
                    ),
                  ),
                  //*****************Second column************************************
                  Column(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      if (nextEvolution != null && prevEvolution != null)
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: prevEvolution.map((e) {
                                  return Text(
                                    e.name,
                                    style: TxtStyles.textStyleWhite,
                                  );
                                }).toList(),
                              ),
                             
                              Row(
                                children: nextEvolution.map((e) {
                                  return Text(
                                    e.name,
                                    style: TxtStyles.textStyleWhite
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                      if (nextEvolution == null)
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: prevEvolution!.map((e) {
                            return Padding(
                              padding: const EdgeInsets.all(15),
                              child: Text(
                                e.name,
                                style: TxtStyles.textStyleWhite
                              ),
                            );
                          }).toList(),
                        ),
                      if (prevEvolution == null)
                        Column(
                          children: [
                            Column(
                              children: nextEvolution!.map((e) {
                                return Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Text(
                                    e.name,
                                    style: TxtStyles.textStyleWhite
                                  ),
                                );
                              }).toList(),
                            )
                          ],
                        ),
                    ],
                  )
                ],
              ),
              const Center(
                child: Text('Display Tab 4'),
              ),
            ],
          ),
        )
      ],
    );
  }
}
