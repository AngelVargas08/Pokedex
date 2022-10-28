import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import '../../../utils/themes/colors_pokemon .dart';

class TabPokemon extends StatelessWidget {
  const TabPokemon({super.key});

  @override
  Widget build(BuildContext context) {
    final Pokemons pokemon =
        ModalRoute.of(context)!.settings.arguments as Pokemons;
    final weaknesses = pokemon.weaknesses;
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

              ),
          child: TabBarView(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                //****Tab About************************************
                //****first column************************************
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    
                    children:  [

                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                        'Height',
                        style: TxtStyles.textStyleGrey,
                      ),
                      Text(
                        'Weight',
                        style: TxtStyles.textStyleGrey,
                      ),
                      Text(
                        'Candy',
                        style: TxtStyles.textStyleGrey,
                      ),
                      Text(
                        'Egg',
                        style: TxtStyles.textStyleGrey,
                      ),
                      Text(
                        'Weaknesses',
                        style: TxtStyles.textStyleGrey,
                      ),
                        ],
                      ),
                      //**********Second column*****************************
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                        pokemon.height.toString(),
                        style: TxtStyles.textStyleWhite,
                      ),
                      Text(
                        pokemon.weight.toString(),
                        style: TxtStyles.textStyleWhite,
                      ),
                      Text(
                        pokemon.candy.toString(),
                        style: TxtStyles.textStyleWhite,
                      ),
                      Text(
                        pokemon.egg.toString(),
                        style: TxtStyles.textStyleWhite,
                      ),
                      Row(
                        children: weaknesses!.map((e) {
                            return Text('${e.name},',style: TxtStyles.textStyleWhite);
                        }).toList(),
                      )
                        ],
                      )
                      
                    ]
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
                        if (nextEvolution == null && prevEvolution == null)
                        Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text('not evolution',
                                    style: TxtStyles.textStyleGrey)
                              ],
                            ),
                          )else
                        if (nextEvolution != null && prevEvolution != null)
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Text('Prev Evolution',
                                    style: TxtStyles.textStyleGrey),
                                
                                Text('Next Evolution',
                                    style: TxtStyles.textStyleGrey)
                              ],
                            ),
                          )else
                        if (nextEvolution == null)
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text('Prev Evolution',
                                    style: TxtStyles.textStyleGrey)
                              ],
                            ),
                          )else
                        if (prevEvolution == null)
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text('Next Evolution',
                                    style: TxtStyles.textStyleGrey)
                              ],
                            ),
                          ),
                          

                      ],
                    ),
                  ),
                  //*****************Second column************************************
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                       if (nextEvolution == null && prevEvolution == null )
                         Column(
                          children: const[
                            Text('No evolution',style: TxtStyles.textStyleWhite,)
                          ],
                        )else
                      if (nextEvolution != null && prevEvolution != null)
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                  return Text(e.name,
                                      style: TxtStyles.textStyleWhite);
                                }).toList(),
                              ),
                            ],
                          ),
                        )else
                      if (nextEvolution == null)
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: prevEvolution!.map((e) {
                            return Padding(
                              padding: const EdgeInsets.all(15),
                              child:
                                  Text(e.name, style: TxtStyles.textStyleWhite),
                            );
                          }).toList(),
                        )else
                      if (prevEvolution == null)
                        Column(
                          children: [
                            Column(
                              children: nextEvolution.map((e) {
                                return Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Text(e.name,
                                      style: TxtStyles.textStyleWhite),
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
