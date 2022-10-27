

import 'package:flutter/material.dart';
import 'package:pokedex/themes/colors_pokemon%20.dart';
import 'package:pokedex/widgets/alert_search.dart';

class TextFieldHome extends StatelessWidget {
  const TextFieldHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: InkWell(
        onTap: () => searchAlert(context),     
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
          color: Colors.black54,
          ),
          width: double.infinity,
          height: 55,
          
      
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(Icons.search, color: Colors.grey,size: 35,),
                Text('Search pokemons,items etc',style: TxtStyles.textStyleGrey,),
                Icon(Icons.mic, color: Colors.grey,size: 35,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

