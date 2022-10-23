
import 'package:flutter/material.dart';



      Color colorspokemons(String tipo){
       return  tipo == 'GRASS' ? Colors.green      : tipo == 'FIRE'? Colors.redAccent:
                   tipo == 'NORMAL'? Colors.grey   : tipo == 'BUG' ? const Color.fromARGB(209, 91, 160, 35):
                   tipo == 'POISON'? Colors.deepPurple: tipo == 'ELECTRIC'? const Color.fromARGB(255, 255, 187, 0):
                   tipo == 'GROUND'? Colors.indigo : tipo == 'FIGHTING'? Colors.orangeAccent : tipo == 'ROCK'? const Color.fromARGB(255, 66, 66, 66)
            : Colors.blueAccent;
}


class TxtStyles {
   
  TxtStyles._();

  static const TextStyle textStyle17 = TextStyle(color: Colors.white, fontSize: 17 );   
  static const TextStyle textStyleGrey = TextStyle(color: Color.fromARGB(255, 168, 168, 168),fontSize: 17,fontWeight: FontWeight.bold);
  static const TextStyle textStyleWhite = TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.bold);

  }

 


    

