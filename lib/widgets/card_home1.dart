

import 'package:flutter/material.dart';

class Card1Screen extends StatelessWidget {

    final String arg; 
    final Color colorText;
    final String route;

  const Card1Screen({super.key, 

    required this.arg, 
    required this.colorText, 
    required this.route
  });
     
  @override
  Widget build(BuildContext context) {

     final size = MediaQuery.of(context).size;

    return SizedBox(

      width: size.width*0.9,
      height: 140,
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(context, route),
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              color: colorText,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children:  [
                  // Padding(padding: EdgeInsets.only(right: 20,)),
                    Row(
                      children: [
                        const Padding(padding: EdgeInsets.only(right: 15,bottom: 70)),
                        Text(arg,
                        style: const TextStyle(
                        fontSize: 45, fontWeight: FontWeight.bold, color: Colors.white)
                        ),

                        //Image(image: NetworkImage(''))
                      ],
                    )
                  ],
                ),
            ),
        ),

    );
  }
}