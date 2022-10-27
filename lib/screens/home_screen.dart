

import 'package:flutter/material.dart';
import 'package:pokedex/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {

   

  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
       
        elevation: 0,
        actions: [
          IconButton(
            onPressed: (){
                
              Drawer(
                child: ListView(
                  children: const [
                    DrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.blue
                      ),
                      child: Text('titulo')
                      )
                  ],
                ),
              );
            }, 
            icon: const Icon(Icons.settings_sharp, size: 30,)
            )
        ],
      ),
      body: SingleChildScrollView(
        
        child: Container(
          width: double.infinity,
          height: size.height,
          color: Colors.grey[900],
          child: Column(
            children:  [
              
              const Padding(padding: EdgeInsets.only(top: 25, )),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Padding(padding: EdgeInsets.only(left: 30)),
                   Text('What are', 
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: Colors.white),),
                  
                ],
              ),
              Row(
                children: const [
                  Padding(padding: EdgeInsets.only(left: 30)),
                  Text('you looking for?', 
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold,color: Colors.white),),
                ],
              ),
              
              const SizedBox(height: 15,),
              const TextFieldHome(),
              const SizedBox(height: 25,),
              const Card1Screen(arg: 'Pokémon', route: 'pokemon', colorText:Colors.green , ),
              const SizedBox(height: 15,),
              Row(
                
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  
                   Card2Screen(name: 'Items', colorsText: Colors.redAccent, 
                               route: 'items',),
                   SizedBox(width: 5,),
                   Card2Screen(name: 'Moves', colorsText: Colors.blueAccent, 
                                route: 'moves',),
                ],
              ),
              const SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                   Card2Screen(name: 'Types', colorsText: Color.fromARGB(255, 255, 187, 0),
                               route: 'types',),
                   SizedBox(width: 5,),
                   Card2Screen(name: 'Favorite', colorsText: Colors.deepPurple,
                              route: 'favorite',),
                ],
              ),
             
             
            ],
          ),
         
        ),
      ),
      
    );
  }
}