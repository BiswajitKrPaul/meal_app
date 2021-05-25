import 'package:flutter/material.dart';
import 'package:meal_app/widgets/categoryitem.dart';
import '../dummydata.dart';

// This route will be used for Categorized of the Meals App on Grid View.
class CategoriesHome extends StatefulWidget {
  static const String routeName = '/categoryHome';
  @override
  _CategoriesHomeState createState() => _CategoriesHomeState();
}

class _CategoriesHomeState extends State<CategoriesHome> {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(16.0),
      children: [
        ...DUMMY_CATEGORIES.map((data) {
          return CategoryItem(data);
        }).toList()
      ],
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200, // max width of each item
        childAspectRatio: 3 / 2, // height and width relation
        crossAxisSpacing: 20, // space between columns and rows
        mainAxisSpacing: 20, // space between columns and rows
      ),
    );
  }
}
