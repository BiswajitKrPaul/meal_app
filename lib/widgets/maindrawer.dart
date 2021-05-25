import 'package:flutter/material.dart';
import 'package:meal_app/routes/filtershome.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(16),
            color: Theme.of(context).primaryColor,
            alignment: Alignment.centerLeft,
            child: Text(
              'Cooking Up !!',
              style: TextStyle(
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          Divider(
            height: 1,
            thickness: 1,
          ),
          ListTile(
            selectedTileColor: Theme.of(context).primaryColor,
            leading: Icon(
              Icons.restaurant,
              size: 26,
            ),
            title: Text(
              'Meals',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          SizedBox(height: 20),
          ListTile(
            selectedTileColor: Theme.of(context).primaryColor,
            leading: Icon(
              Icons.settings,
              size: 26,
            ),
            title: Text(
              'Filtes',
              style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(FiltersHome.routeName);
            },
          ),
        ],
      ),
    );
  }
}
