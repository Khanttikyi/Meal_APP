import 'package:Meal_APP/models/meal-model.dart';
import 'package:Meal_APP/widgets/mean_item.dart';
import 'package:flutter/material.dart';

class Favourite extends StatelessWidget {
  final List<Meal> favouriteMeal;
  Favourite(this.favouriteMeal);
  @override
  Widget build(BuildContext context) {
    if (favouriteMeal.isEmpty) {
      return Center(
        child: Text(
          'You have no favourite yet !',
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
      );
    } else {
      return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/foodbg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: ListView.builder(
            itemBuilder: (vtx, index) {
              return MealItem(
                id: favouriteMeal[index].id,
                title: favouriteMeal[index].title,
                imageurl: favouriteMeal[index].imageUrl,
                duration: favouriteMeal[index].duration,
                affordability: favouriteMeal[index].affordability,
                complexity: favouriteMeal[index].complexity,
                // removeItem: _removeMeanId,
              );
            },
            itemCount: favouriteMeal.length,
          ),
        ),
      );
    }
  }
}
