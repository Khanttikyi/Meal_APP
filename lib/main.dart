import 'package:Meal_APP/dummy_data.dart';
import 'package:Meal_APP/models/meal-model.dart';
import 'package:Meal_APP/screens/categories.dart';
import 'package:Meal_APP/screens/categories_detail.dart';
import 'package:Meal_APP/screens/home-page.dart';
import 'package:Meal_APP/screens/meal_detail.dart';
import 'package:Meal_APP/screens/setting.dart';
import 'package:Meal_APP/screens/tab_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filter = {
    'gluten': false,
    'lactose': false,
    'vegen': false,
    'vegetarian': false,
  };
  List<Meal> avaliableMeal = DUMMY_MEALS;
  List<Meal> favouriteMeal = [];
  void setFilter(Map<String, bool> filterdata) {
    setState(() {
      filter = filterdata;
      avaliableMeal = DUMMY_MEALS.where((meal) {
        if (filter['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (filter['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (filter['vegen'] && !meal.isVegan) {
          return false;
        }
        if (filter['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void toggleFavourite(String mealId) {
    final existingIndex = favouriteMeal.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        favouriteMeal.removeAt(existingIndex);
      });
    } else {
      setState(() {
        favouriteMeal.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }
  bool isFavourite(String mealId){
    return favouriteMeal.any((meal) => meal.id==mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deli Meal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        accentColor: Colors.orangeAccent,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              title: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold),
            ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: Categories(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => HomeScreen(),
        TabScreen.routeName: (ctx) => TabScreen(favouriteMeal),
        CategoriesDetail.routeName: (ctx) => CategoriesDetail(avaliableMeal),
        MealDetail.routeName: (ctx) => MealDetail(toggleFavourite,isFavourite),
        Setting.routeName: (ctx) => Setting(filter, setFilter),
      },
      onGenerateRoute: (setting) {
        //  if(setting.name)
        return MaterialPageRoute(builder: (ctx) => Categories());
      },
      onUnknownRoute: (setting) {
        return MaterialPageRoute(builder: (ctx) => Categories());
      },
    );
  }
}
