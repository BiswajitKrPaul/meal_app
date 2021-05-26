import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';

class MealDetail extends StatelessWidget {
  static const String routeName = '/MealDetail';
  Function addToFav;

  MealDetail(this.addToFav);

  Widget buildContainerTitle(BuildContext context, String title) {
    return Container(
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline2,
      ),
    );
  }

  Widget buildListContainer(BuildContext ctx, Widget childwidget) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      height: 200,
      width: MediaQuery.of(ctx).size.width * 0.45,
      child: childwidget,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Meal mealItem = ModalRoute.of(context).settings.arguments as Meal;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${mealItem.title}',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 300,
              child: Image.network(
                mealItem.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 9,
                    ),
                    buildContainerTitle(context, 'Ingredients'),
                    SizedBox(
                      height: 8,
                    ),
                    buildListContainer(
                      context,
                      ListView.builder(
                        itemBuilder: (ctx, index) {
                          return Column(
                            children: [
                              ListTile(
                                leading: Text('#${(index + 1)}'),
                                title: Text(
                                  '${mealItem.ingredients[index]}',
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                              ),
                              Divider()
                            ],
                          );
                        },
                        itemCount: mealItem.ingredients.length,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 9,
                    ),
                    buildContainerTitle(context, 'Steps'),
                    SizedBox(
                      height: 8,
                    ),
                    buildListContainer(
                      context,
                      ListView.builder(
                        itemBuilder: (ctx, index) {
                          return Column(
                            children: [
                              ListTile(
                                leading: Text('#${(index + 1)}'),
                                title: Text(
                                  '${mealItem.steps[index]}',
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                                dense: true,
                              ),
                              Divider(),
                            ],
                          );
                        },
                        itemCount: mealItem.steps.length,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addToFav(mealItem),
        child: Icon(Icons.favorite),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
