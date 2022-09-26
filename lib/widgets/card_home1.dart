

import 'package:flutter/material.dart';

class Card1Screen extends StatelessWidget {

    final String arg; 
    final Color colorText;
  const Card1Screen({super.key, required this.arg, required this.colorText});
     
  @override
  Widget build(BuildContext context) {

     final size = MediaQuery.of(context).size;

    return SizedBox(

      width: size.width*0.9,
      height: 140,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Card(
            color: colorText,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children:  [
                  ListTile( 
                    title: Text(arg, 
                    style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    
                  ),
                  
                ],
              ),
          ),
        ),

    );
  }
}