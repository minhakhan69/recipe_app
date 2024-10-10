import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AllCategories extends StatelessWidget {
  String name;


  List<Map<String, dynamic>> specificRecipes = [];

  AllCategories({super.key, required this.name, required this.specificRecipes});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(backgroundColor: Colors.white,
        appBar: AppBar(backgroundColor: Colors.brown.withOpacity(0.5),
          title: Text(name,style:TextStyle(color: Colors.brown,fontSize: 0.330.dp,fontWeight: FontWeight.bold)),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: specificRecipes.length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding:  EdgeInsets.all(20),
                      child: Container(
      
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.zero,
                          border: Border.all(color: Colors.brown),
                          
                        ),
                        height: 50.h,
                        width: 300.w,
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
                                  fontSize: 0.280.dp,
                                  fontWeight: FontWeight.w800,color: Colors.brown,backgroundColor: Colors.yellow
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
      ),
    );
  }
}
