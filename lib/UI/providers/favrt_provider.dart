import 'package:flutter/material.dart';

class FavoriteProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _favoriteRecipes = [];

  List<Map<String, dynamic>> get favoriteRecipes => _favoriteRecipes;

  bool isFavorite(Map<String, dynamic> recipe) {
    return _favoriteRecipes.contains(recipe);
  }

  void toggleFavorite(Map<String, dynamic> recipe) {
    if (isFavorite(recipe)) {
      _favoriteRecipes.remove(recipe);
    } else {
      _favoriteRecipes.add(recipe);
    }
    notifyListeners(); // Notify listeners to update UI
  }
}
