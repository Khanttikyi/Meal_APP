import 'package:Meal_APP/models/meal-model.dart';
import 'package:Meal_APP/screens/meal_detail.dart';
import 'package:flutter/material.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageurl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  // final Function removeItem;

  MealItem(
      {@required this.id,
      @required this.title,
      @required this.imageurl,
      @required this.duration,
      @required this.affordability,
      @required this.complexity,
      // @required this.removeItem
      });

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;

      case Complexity.Challenging:
        return 'Challenging';
        break;

      case Complexity.Hard:
        return 'Hard';
        break;

      default:
        return 'Unknown';
        break;
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;

      case Affordability.Luxurious:
        return 'Luxurious';
        break;

      case Affordability.Pricey:
        return 'Pricey';
        break;

      default:
        return 'Unknown';
        break;
    }
  }

  void selectMeal(ctx) {
    Navigator.of(ctx).pushNamed(
      MealDetail.routeName,
      arguments: id,
    ).then((res) => {
      if(res !=null){
        // removeItem(res)
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: InkWell(
        onTap: () => selectMeal(context),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 5,
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Image.network(
                      imageurl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                      bottom: 20,
                      right: 15,
                      child: Container(
                        width: 250,
                        color: Colors.black26,
                        padding: EdgeInsets.all(5),
                        child: Text(
                          title,
                          style: TextStyle(fontSize: 23, color: Colors.white),
                          overflow: TextOverflow.fade,
                          softWrap: true,
                        ),
                      ))
                ],
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.schedule),
                                SizedBox(width: 6),
                                Text('$duration min'),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.work),
                                SizedBox(width: 5),
                                Text(complexityText),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.attach_money),
                                SizedBox(width: 5),
                                Text(affordabilityText),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
