import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';

class TabPokemon extends StatelessWidget {
  const TabPokemon({super.key});

  @override
  Widget build(BuildContext context) {
    final Pokemons pokemon =
        ModalRoute.of(context)!.settings.arguments as Pokemons;
    final type = pokemon.weaknesses;
    final nextEvolution = pokemon.nextEvolution;
    final prevEvolution = pokemon.prevEvolution;

    return Column(
      children: [
        const TabBar(indicatorColor: Colors.white, tabs: [
          Tab(
            child: Text(
              'About',
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
          ),
          Tab(
            child: Text(
              'Evolution',
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
          ),
          Tab(
            child: Text(
              'Moves',
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
          ),
        ]),
        Container(
          height: 350,
          decoration: const BoxDecoration(
              // color: Colors.amber,
              border: Border(top: BorderSide(color: Colors.white, width: 0.5))),
          child: TabBarView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 40),
                    //****Tab About************************************
                    //****first column************************************
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text(
                          'Height',
                          style: TextStyle(
                              color: Color.fromARGB(255, 168, 168, 168),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Weight',
                          style: TextStyle(
                              color: Color.fromARGB(255, 168, 168, 168),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Candy',
                          style: TextStyle(
                              color: Color.fromARGB(255, 168, 168, 168),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Egg',
                          style: TextStyle(
                              color: Color.fromARGB(255, 168, 168, 168),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Weaknesses',
                          style: TextStyle(
                              color: Color.fromARGB(255, 168, 168, 168),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  //****Second column************************************
                  Padding(
                    padding: const EdgeInsets.only(top: 20, right: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(pokemon.height.toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        Text(pokemon.weight.toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        Text(pokemon.candy.toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        Text(pokemon.egg.toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        Row(
                            children: type!.map((e) {
                          return Text('${e.name}, ',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold));
                        }).toList())
                      ],
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 60),
                    //***********Column next/prev evolution************************************
                    //*****************first column************************************
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        if (nextEvolution != null && prevEvolution != null)
                          Column(
                            children: const [
                              Text('Prev Evolution',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 168, 168, 168),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                                      SizedBox(height: 50,),
                              Text('Next Evolution',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 168, 168, 168),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                        if (nextEvolution == null)
                          Column(
                            children: const [
                              Text('Prev Evolution',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 168, 168, 168),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                        if (prevEvolution == null)
                          Column(
                            children: const [
                              Text('Next Evolution',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 168, 168, 168),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold))
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
                        Column(
                          children: [
                            Row(
                              children: prevEvolution.map((e) {
                                return Text(
                                  e.name,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                );
                              }).toList(),
                            ),
                              const SizedBox(height: 50,),
                            Row(
                              children: nextEvolution.map((e) {
                                return Text(
                                  e.name,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      if (nextEvolution == null)
                        
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: prevEvolution!.map((e) {
                                return Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Text(
                                    e.name,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
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
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
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
