import 'dart:ui';

import 'package:Meal_APP/screens/setting.dart';
import 'package:Meal_APP/screens/tab_screen.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget buildListTile(String title, IconData icon, Function tabHandler) {
    return Card(
      elevation: 10,
      color: Colors.orangeAccent,
      child: ListTile(
        leading: Icon(
          icon,
          size: 26,
        ),
        title: Text(
          title,
          style: TextStyle(
              fontFamily: 'Roboto', fontSize: 20, fontWeight: FontWeight.w400),
        ),
        onTap: tabHandler,
      ),
    );
  }

  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: <Widget>[
        Container(
          height: 150,
          width: double.infinity,
          padding: EdgeInsets.all(15),
          alignment: Alignment.centerLeft,
          color: Theme.of(context).accentColor,
          child: Text(
            'Cooking up !',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black),
          ),
        ),
        SizedBox(height: 10),
        buildListTile('Meals', Icons.restaurant, () {
          Navigator.of(context).pushReplacementNamed(TabScreen.routeName);
        }),
        buildListTile('Setting', Icons.settings, () {
          Navigator.of(context).pushReplacementNamed(Setting.routeName);
        }),
      ],
    ));
  }
}
