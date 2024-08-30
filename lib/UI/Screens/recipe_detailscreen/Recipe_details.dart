import 'package:flutter/material.dart';

class RecipeDetails extends StatelessWidget {
  String name;
  String image;
  String ingredients;
  String instructions;

  RecipeDetails(
      {super.key,
      required this.name,
      required this.image,
      required this.ingredients,
      required this.instructions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 40, bottom: 10, left: 10),
            child: Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 36,
                fontStyle: FontStyle.italic,
                color: Colors.pink,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(image),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10, right: 250),
            child: Text(
              'Ingredients:',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.pink),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(ingredients,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10, right: 250),
            child: Text(
              'Instructions:',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.pink),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              instructions,
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
