import 'package:flutter/material.dart';

Future<void> searchAlert(BuildContext context) async {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          content: SizedBox(
            width: 400,
            height: 500,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                TextField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide(color: Colors.blue, width: 1)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide(color: Colors.black, width: 1)),
                    prefixIcon: Icon(
                      Icons.search,
                      size: 35,
                      color: Colors.grey,
                    ),
                    suffixIcon: Icon(
                      Icons.mic,
                      size: 35,
                      color: Colors.grey,
                    ),
                    filled: true,
                    
                    labelText: 'Search pokemons, items etc',
                    labelStyle: TextStyle(color: Colors.grey),
                  ),
                )
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancelar')),
          ],
        );
      });
}
