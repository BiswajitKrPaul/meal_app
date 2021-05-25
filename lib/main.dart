import 'package:flutter/material.dart';
import 'package:meal_app/routes/filtershome.dart';
import 'package:meal_app/routes/mealdetail.dart';
import './routes/categorymealshome.dart';

import './routes/bottomnavigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.amber,
        canvasColor: Colors.blue[50],
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontSize: 24,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              headline1: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Roboto',
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              headline2: TextStyle(
                fontSize: 16.0,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              subtitle1: TextStyle(
                fontSize: 12.0,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
      ),
      home: BottomNavigation(),
      routes: {
        CategoryMealsHome.routeName: (ctx) => CategoryMealsHome(),
        MealDetail.routeName: (ctx) => MealDetail(),
        FiltersHome.routeName: (ctx) => FiltersHome(),
      },
    );
  }
}
