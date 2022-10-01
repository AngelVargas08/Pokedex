// ignore: file_names



import 'package:flutter/material.dart';

AppBar appbarPokemon() {
    return AppBar(
      iconTheme: const IconThemeData(
        color: Colors.black),
      actions: [
        IconButton(
          onPressed: (){},
           icon: const Image(image: AssetImage('assets/ball.png'),
           //width: 100,
           )
           )
      ],
      elevation: 0,
      backgroundColor: const Color.fromARGB(0, 238, 238, 238),
      title: const Center(
        child:  Image(image: AssetImage('assets/logo.png'),
        width: 150,
        fit: BoxFit.cover,
        //alignment:  Alignment.center,
     
        ),
      ),
     );
  }