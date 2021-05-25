import 'package:flutter/material.dart';
import 'package:meal_app/widgets/maindrawer.dart';

class FiltersHome extends StatelessWidget {
  static String routeName = 'filtersHome';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Filters'),
      ),
      body: Center(
        child: Text('Filter'),
      ),
    );
  }
}
