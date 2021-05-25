import 'package:flutter/material.dart';

class CategoryMealsHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routeArguments =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final id = routeArguments['id'];
    final title = routeArguments['title'];
    return Scaffold(
      appBar: AppBar(
        title: Text('$title'),
      ),
      body: Center(
        child: Text(
          '$title',
        ),
      ),
    );
  }
}
