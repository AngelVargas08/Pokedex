

import 'package:flutter/material.dart';

class Card2Screen extends StatelessWidget {

  final String name;
  final Color colorsText;
  final String route;

  const Card2Screen({super.key,

     required this.name,
     required this.colorsText,
     required this.route
    }
    );

  @override
  Widget build(BuildContext context) {

    final  size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width*0.45,
      height: 120,
      child: InkWell(
        onTap: () =>Navigator.pushNamed(context, route) ,
        child: Card(
           
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 10,
            color: colorsText,
                child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                   
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(name, 
                      style: const TextStyle(
                        fontSize: 33, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                    )
                  ],
                ),
          ),
      ),
    );
  }
}