import 'package:flutter/material.dart';
import '../models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  CategoryItem(this.category);

  // This Commented code has the different type of route implementation.

  // void nabigateToCategoryMealHome(BuildContext ctx) {
  //   Navigator.of(ctx).push(
  //     MaterialPageRoute(
  //       builder: (_) {
  //         return CategoryMealsHome(category.id, category.title);
  //       },
  //       fullscreenDialog:
  //           false, /* false for default animation :
  //           true for Material design animation (For routing the pages) */
  //     ),
  //   );

  void nabigateToCategoryMealHome(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      'categoryMealHome',
      arguments: {
        'id': category.id,
        'title': category.title
      }, // Passing the data just as intent
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => nabigateToCategoryMealHome(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Text(
            category.title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [category.color.withOpacity(0.7), category.color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
