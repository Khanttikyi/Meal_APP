import 'package:Meal_APP/dummy_data.dart';
import 'package:Meal_APP/models/meal-model.dart';
import 'package:Meal_APP/widgets/mean_item.dart';
import 'package:flutter/material.dart';

class CategoriesDetail extends StatefulWidget {
  static const routeName = 'category-detail';
  final List<Meal> avaliableMeal;
  CategoriesDetail(this.avaliableMeal);
  @override
  _CategoriesDetailState createState() => _CategoriesDetailState();
}

class _CategoriesDetailState extends State<CategoriesDetail> {
  String categoryID;
  String categoryTitle;
  List<Meal> categoryMeal;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    final routeArg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    categoryID = routeArg['categoryID'];
    categoryTitle = routeArg['categoryTitle'];
    // final Color categorycolor = routeArg['categorycolor'];
    categoryMeal = widget.avaliableMeal.where((meal) {
      return meal.categories.contains(categoryID);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeMeanId(String meanID) {
    setState(() {
      categoryMeal.removeWhere((meal) => meal.id == meanID);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView.builder(
        itemBuilder: (vtx, index) {
          return MealItem(
            id: categoryMeal[index].id,
            title: categoryMeal[index].title,
            imageurl: categoryMeal[index].imageUrl,
            duration: categoryMeal[index].duration,
            affordability: categoryMeal[index].affordability,
            complexity: categoryMeal[index].complexity,
            // removeItem: _removeMeanId,
          );
        },
        itemCount: categoryMeal.length,
      ),
    );
  }
}
