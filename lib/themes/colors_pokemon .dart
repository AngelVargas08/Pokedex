import 'package:flutter/material.dart';



      Color colorspokemons(String tipo){
       return  tipo == 'GRASS' ? Colors.green      : tipo == 'FIRE'? Colors.redAccent:
                   tipo == 'NORMAL'? Colors.grey   : tipo == 'BUG' ? Color.fromARGB(209, 91, 160, 35):
                   tipo == 'POISON'? Colors.deepPurple: tipo == 'ELECTRIC'? Color.fromARGB(255, 255, 187, 0):
                   tipo == 'GROUND'? Colors.indigo : tipo == 'FIGHTING'? Colors.orangeAccent : tipo == 'ROCK'? Color.fromARGB(255, 66, 66, 66)
            : Colors.blueAccent;
}
 

