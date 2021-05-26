import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/mealitems.dart';

class CategoryMealsHome extends StatefulWidget {
  static const String routeName = '/categoryMealsHome';
  List<Meal> availableMeals;
  CategoryMealsHome(this.availableMeals);

  @override
  _CategoryMealsHomeState createState() => _CategoryMealsHomeState();
}

class _CategoryMealsHomeState extends State<CategoryMealsHome> {
  String title;
  String id;
  List<Meal> categoryMeal;

  @override
  void didChangeDependencies() {
    final routeArguments =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    id = routeArguments['id'];
    title = routeArguments['title'];
    categoryMeal = widget.availableMeals.where((element) {
      return element.categories.contains(id);
    }).toList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$title'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            mealItem: categoryMeal.elementAt(index),
          );
        },
        itemCount: categoryMeal.length,
      ),
    );
  }
}
