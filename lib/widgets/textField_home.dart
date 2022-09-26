

import 'package:flutter/material.dart';

class TextFieldHome extends StatelessWidget {
  const TextFieldHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: const TextField(
               decoration: InputDecoration(
                
               fillColor: Colors.amber,
               prefixIcon: Icon(Icons.search, size: 35, color: Colors.white,),
               suffixIcon: Icon(Icons.mic, size: 35, color: Colors.white,),
               border: OutlineInputBorder(),        
                labelText: 'Search pokemons, items etc',
                labelStyle: TextStyle(color: Colors.grey)
              )
          ),
        ),

    );
  }
}