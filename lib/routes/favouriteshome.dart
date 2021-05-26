import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/mealitems.dart';

class FavouritesHome extends StatelessWidget {
  List<Meal> favouriteMeal;
  FavouritesHome(this.favouriteMeal);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return MealItem(
          mealItem: favouriteMeal.elementAt(index),
        );
      },
      itemCount: favouriteMeal.length,
    );
  }
}
