import 'package:Meal_APP/dummy_data.dart';
import 'package:flutter/material.dart';
import '../widgets/categories_item.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/foodbg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: GridView(
        padding: EdgeInsets.all(15),
        children: DUMMY_CATEGORIES
            .map((data) => CategoriesItem(data.id, data.title, data.color))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            mainAxisSpacing: 40,
            crossAxisSpacing: 20),
      ),
    );
  }
}
