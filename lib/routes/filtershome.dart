import 'package:flutter/material.dart';
import 'package:meal_app/widgets/maindrawer.dart';

class FiltersHome extends StatefulWidget {
  static String routeName = 'filtersHome';
  var _glutienfree;
  var _vegan;
  var _vegetarian;
  var _lactosefree;
  Function setFilters;
  FiltersHome(this.setFilters, this._glutienfree, this._lactosefree,
      this._vegan, this._vegetarian);

  @override
  _FiltersHomeState createState() => _FiltersHomeState();
}

class _FiltersHomeState extends State<FiltersHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () => widget.setFilters(widget._glutienfree,
                widget._vegan, widget._vegetarian, widget._lactosefree),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Set Filters for the meal',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              SwitchListTile(
                title: Text(
                  'Is Glutien Free',
                  style: Theme.of(context).textTheme.headline2,
                ),
                subtitle: Text('Shows Foods Which are Glutien Free'),
                value: widget._glutienfree,
                onChanged: (val) {
                  setState(() {
                    widget._glutienfree = val;
                  });
                },
              ),
              SwitchListTile(
                title: Text(
                  'Is Lactose Free',
                  style: Theme.of(context).textTheme.headline2,
                ),
                subtitle: Text('Shows Foods Which are Lactose Free'),
                value: widget._lactosefree,
                onChanged: (val) {
                  setState(() {
                    widget._lactosefree = val;
                  });
                },
              ),
              SwitchListTile(
                title: Text(
                  'Is Vegan Free',
                  style: Theme.of(context).textTheme.headline2,
                ),
                subtitle: Text('Shows Foods Which are Non Vegetarian'),
                value: widget._vegan,
                onChanged: (val) {
                  setState(() {
                    widget._vegan = val;
                  });
                },
              ),
              SwitchListTile(
                title: Text(
                  'Is Vegetarian',
                  style: Theme.of(context).textTheme.headline2,
                ),
                subtitle: Text('Shows Foods Which are Vegetarian'),
                value: widget._vegetarian,
                onChanged: (val) {
                  setState(() {
                    widget._vegetarian = val;
                  });
                },
              ),
            ],
          ))
        ],
      ),
    );
  }
}
