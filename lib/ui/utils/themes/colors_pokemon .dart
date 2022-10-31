
import 'package:flutter/material.dart';



      Color colorspokemons(String tipo){
       return      tipo == 'grass' ? const Color(0xFF62B957) : tipo == 'fire'    ? const Color(0xFFFD7D24):
                   tipo == 'normal'? const Color(0xFF9DA0AA) : tipo == 'bug'     ? const Color(0xFF8CB230):
                   tipo == 'poison'? const Color(0xFFA552CC) : tipo == 'electric'? const Color(0xFFEED535):
                   tipo == 'ground'? const Color(0xFFDD7748) : tipo == 'fighting'? const Color(0xFFD04164): 
                   tipo == 'rock'  ? const Color(0xFFBAAB82) : tipo == 'psychic' ? const Color(0xFFEA5D60):
                    const Color(0xFF4A90DA);
}
      Color colorstypes(String tipo){
       return      tipo == 'grass' ? const Color(0xFF8BBE8A) : tipo == 'fire'    ? const Color(0xFFFFA756):
                   tipo == 'normal'? const Color(0xFFB5B9C4) : tipo == 'bug'     ? const Color.fromARGB(255, 128, 199, 107):
                   tipo == 'poison'? const Color(0xFF9F6E97) : tipo == 'electric'? const Color(0xFFF2CB55):
                   tipo == 'ground'? const Color(0xFFF78551) : tipo == 'fighting'? const Color(0xFFEB4971): 
                   tipo == 'rock'  ? const Color(0xFFD4C294) : tipo == 'psychic' ? const Color(0xFFFF6568):
                  const Color(0xFF58ABF6);
}



class TxtStyles {
   
  TxtStyles._();

  static const TextStyle textStyle17 = TextStyle(color: Colors.white, fontSize: 17 );   
  static const TextStyle textStyleGrey = TextStyle(color: Color.fromARGB(255, 168, 168, 168),fontSize: 17,fontWeight: FontWeight.bold);
  static const TextStyle textStyleWhite = TextStyle(color: Colors.white, fontSize: 17,fontWeight: FontWeight.bold);

  }


  class ThemesPokemon {
    ThemesPokemon._();

    static  Color? darkmode = Colors.grey[900];
  }

 


    

