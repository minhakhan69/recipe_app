import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 5.h, bottom: 1.h, left: 1.h),
                child: Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 0.300.dp,
                    fontStyle: FontStyle.italic,
                    color: Colors.pink,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  image,
                  height: 30.h,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 3.h, bottom: 1.h, right: 30.h),
                child: Text(
                  'Ingredients:',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 0.250.dp,
                      color: Colors.pink),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(ingredients,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 0.250.dp, fontWeight: FontWeight.w500)),
              ),
              Padding(
                padding: EdgeInsets.only(top: 3.h, bottom: 1.h, right: 32.h),
                child: Text(
                  'Instructions:',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 0.250.dp,
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
        ),
      ),
    );
  }
}
