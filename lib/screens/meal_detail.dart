import 'package:Meal_APP/dummy_data.dart';
import 'package:flutter/material.dart';

class MealDetail extends StatelessWidget {
  static const routeName = '/meal-detail';
  final Function setfavourite;
  final Function isFavourite;
  MealDetail(this.setfavourite,this.isFavourite);
  Widget buildTitle(BuildContext context, String txt) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Text(
        txt,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildContainter(child) {
    return Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(15)),
        height: 200,
        width: double.infinity,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final mealID = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealID);
    
    return Scaffold(
        appBar: AppBar(
          title: Text('${selectedMeal.title}'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              buildTitle(context, "${selectedMeal.title}'s Ingredients "),
              buildContainter(ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Colors.white60,
                  child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        selectedMeal.ingredients[index],
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )),
                ),
                itemCount: selectedMeal.ingredients.length,
              )),
              buildTitle(context, "${selectedMeal.title}'s Step"),
              buildContainter(ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${(index + 1)}'),
                      ),
                      title: Text(selectedMeal.steps[index]),
                    ),
                    Divider(),
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              )),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(child: Icon(isFavourite(mealID)?Icons.favorite:Icons.favorite_border),
        onPressed:()=>setfavourite(mealID),),
        );
  }
}
