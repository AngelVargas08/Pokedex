

import 'package:flutter/material.dart';

class TextFieldHome extends StatelessWidget {
  const TextFieldHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
        child: const TextField(
               decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(color: Colors.white,width: 1)
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(width: 1)
                ),
              
               
               prefixIcon: Icon(Icons.search, size: 35, color: Colors.grey,),
               suffixIcon: Icon(Icons.mic, size: 35, color: Colors.grey,),
                filled: true,
                fillColor: Colors.black54,
                labelText: 'Search pokemons, items etc',
                labelStyle: TextStyle(color: Colors.grey),
                
              )
          ),

    );
  }
}