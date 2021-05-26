import 'package:flutter/material.dart';
import 'package:meal_app/dummydata.dart';
import 'package:meal_app/routes/filtershome.dart';
import 'package:meal_app/routes/mealdetail.dart';
import './routes/categorymealshome.dart';

import './routes/bottomnavigation.dart';
import './models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _glutienfree = false;
  var _vegan = false;
  var _vegetarian = false;
  var _lactosefree = false;

  List<Meal> availableMeal = DUMMY_MEALS;
  List<Meal> favouriteMeal = [];

  void _setFilters(bool gluetien, bool vegan, bool vegetarian, bool lactose) {
    setState(() {
      _glutienfree = gluetien;
      _vegan = vegan;
      _vegetarian = vegetarian;
      _lactosefree = lactose;
      availableMeal = DUMMY_MEALS.where((element) {
        if (_glutienfree && !element.isGlutenFree) {
          return false;
        }
        if (_vegan && !element.isVegan) {
          return false;
        }
        if (_lactosefree && !element.isLactoseFree) {
          return false;
        }
        if (_vegetarian && !element.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void addToFavourite(Meal mealItem) {
    if (favouriteMeal.indexOf(mealItem) < 0) {
      setState(() {
        favouriteMeal.add(mealItem);
      });
    } else {
      setState(() {
        favouriteMeal.remove(mealItem);
      });
    }
  }

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
              headline5: TextStyle(
                fontSize: 24,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
      ),
      home: BottomNavigation(favouriteMeal),
      routes: {
        CategoryMealsHome.routeName: (ctx) => CategoryMealsHome(availableMeal),
        MealDetail.routeName: (ctx) => MealDetail(addToFavourite),
        FiltersHome.routeName: (ctx) => FiltersHome(
            _setFilters, _glutienfree, _lactosefree, _vegan, _vegetarian),
      },
    );
  }
}
