import 'package:Meal_APP/models/meal-model.dart';
import 'package:Meal_APP/screens/categories.dart';
import 'package:Meal_APP/screens/favourite.dart';
import 'package:Meal_APP/widgets/drawer.dart';
import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
  static const routeName = '/tab-screen';
  final List<Meal> favouriteMeal;
  TabScreen(this.favouriteMeal);
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
   List<Map<String, Object>> _pages;
  int selectedPageIndex = 0;


 
  
@override
  void initState() {
    // TODO: implement initState
    _pages = [
    {'page': Categories(), 'title': 'Category'},
    {'page': Favourite(widget.favouriteMeal), 'title': 'Favourite'},
  ];
    super.initState();
  }
   void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    // return DefaultTabController(
    //   length: 2,
    //   // initialIndex: 0,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: Text('Meals'),
    //       bottom: TabBar(

    //         tabs: <Widget>[
    //           Tab(
    //             icon: Icon(Icons.category),
    //             text: 'Category',
    //           ),
    //           Tab(
    //             icon: Icon(Icons.favorite),
    //             text: 'Favourite',
    //           ),
    //         ],
    //       ),
    //     ),
    //     body: TabBarView(children: <Widget>[
    //       Categories(),
    //       Favourite()
    //     ],),
    //   ),
    // );

    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        elevation: 2,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.blue,
        currentIndex: selectedPageIndex,
        selectedFontSize: 15,
        unselectedFontSize: 12,
        // type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text('Category'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.favorite),
            title: Text('Favourite'),
          )
        ],
      ),
    );
  }
}
