import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>>{
  FavoriteMealsNotifier() : super([]);

  bool toggleMealsFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);
    
    if (mealIsFavorite){
      state = state.where((m) => m.id != m.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
    
    state = [];

  }
}

final favoriteMealsProvider = 
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});