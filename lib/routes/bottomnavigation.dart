import 'package:flutter/material.dart';
import 'package:meal_app/routes/categoryhome.dart';
import 'package:meal_app/routes/favouriteshome.dart';
import 'package:meal_app/widgets/maindrawer.dart';
import '../models/meal.dart';

class BottomNavigation extends StatefulWidget {
  static String routeName = 'bottomNavigation';
  List<Meal> favouriteMeal;
  BottomNavigation(this.favouriteMeal);
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  List<Widget> _pages;

  final List<String> _titles = [
    'Meal Category',
    'Favourites',
  ];
  int _selectedPage = 0;

  void selectPage(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  void initState() {
    _pages = [
      CategoriesHome(),
      FavouritesHome(widget.favouriteMeal),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedPage]),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        onTap: selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.60),
        currentIndex: _selectedPage,
        selectedFontSize: 16,
        unselectedFontSize: 14,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            label: 'Favourites',
          )
        ],
      ),
    );
  }
}
