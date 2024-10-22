import 'package:cook_together/UI/Screens/all_categories/all_categories.dart';
import 'package:cook_together/UI/providers/favrt_provider.dart';
import 'package:cook_together/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    final _favprovider = Provider.of<FavoriteProvider>(context);
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text(
              'Farvouite',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 35),
            ),
            backgroundColor: Colors.yellow.shade700,
          ),
          body: ListView.builder(
            itemCount: _favprovider.favoriteRecipes.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                      _favprovider.favoriteRecipes[index]['image'].toString()),
                ),
                title: Text(
                  (_favprovider.favoriteRecipes[index]['name'].toString()),
                ),
              );
            },
          )),
    );
  }
}
