import 'package:flutter/material.dart';
import '../dummydata.dart';
import '../widgets/mealitems.dart';

class CategoryMealsHome extends StatelessWidget {
  static const String routeName = '/categoryMealsHome';
  @override
  Widget build(BuildContext context) {
    final routeArguments =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final id = routeArguments['id'];
    final title = routeArguments['title'];
    final categoryMeal = DUMMY_MEALS.where((element) {
      return element.categories.contains(id);
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('$title'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(categoryMeal.elementAt(index));
        },
        itemCount: categoryMeal.length,
      ),
    );
  }
}
