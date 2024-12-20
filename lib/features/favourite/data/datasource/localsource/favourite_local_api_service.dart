import 'dart:convert';
import 'package:rentpal/features/rentitem/domain/entity/rentitem_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavouirteLocalApiService {
  static const _favoritesKey = 'favorites';

  Future<bool> addFavorite(RentitemEntity item) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = await getFavorites();

    // Avoid duplicates
    if (!favorites.contains(item)) {
      favorites.add(item);
      final favoritesJson =
          favorites.map((e) => e.toJson()).toList(); // Convert to JSON list
      await prefs.setString(_favoritesKey, jsonEncode(favoritesJson));
      return true;
    }
    return false;
  }

  // Remove a favorite item
  Future<bool> removeFavorite(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = await getFavorites();

    favorites.removeWhere((favorite) => favorite.id == id);
    final favoritesJson = favorites.map((e) => e.toJson()).toList();
    await prefs.setString(_favoritesKey, jsonEncode(favoritesJson));
    return true;

  }

  // Get all favorite items
  Future<List<RentitemEntity>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoritesString = prefs.getString(_favoritesKey);

    if (favoritesString != null) {
      final List<dynamic> jsonList = jsonDecode(favoritesString);
      return RentitemEntity.fromJsonList(jsonList);
    }
    return [];
  }

  // Check if an item is a favorite
  Future<bool> isFavorite(int id) async {
    final favorites = await getFavorites();
    return favorites.any((favorite) => favorite.id == id);
  }

  // Clear all favorite items
  Future<void> clearFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_favoritesKey);
  }
}
