import 'package:flutter/material.dart';
import './routes/categorymealshome.dart';

import './routes/categoryhome.dart';

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
        canvasColor: Colors.grey[50],
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
                  fontFamily: 'Raleway',
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
      ),
      home: CategoriesHome(),
      routes: {
        'categoryMealHome': (ctx) => CategoryMealsHome(),
      },
    );
  }
}
