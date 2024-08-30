import 'package:flutter/material.dart';

class AllCategories extends StatelessWidget {
  String name;


  List<Map<String, dynamic>> specificRecipes = [];

  AllCategories({super.key, required this.name, required this.specificRecipes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: specificRecipes.length,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.zero,
                        border: Border.all(color: Colors.pink),
                        
                      ),
                      height: 400,
                      width: 300,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              specificRecipes[index]['image'],
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                             Text(
                              specificRecipes[index]['name'],
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w800,color: Colors.pink
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(specificRecipes[index]['ingredients'].toString()),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(specificRecipes[index]['instructions'].toString()),
                            ),
                          ]),
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
