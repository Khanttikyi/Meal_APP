import 'package:Meal_APP/widgets/drawer.dart';
import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  static const routeName = '/setting';
  final Function saveFilter;
   
  final Map<String, bool> currentdata;
  Setting(this.currentdata,this.saveFilter);
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  var _glutenFree = false;
  var _vegentarian = false;
  var _vegen = false;
  var _lactoesFree = false;
  @override
  initState() {
    _glutenFree = widget.currentdata['gluten'];
    _vegentarian = widget.currentdata['vegetarian'];
    _vegen = widget.currentdata['vegen'];
    _lactoesFree = widget.currentdata['lactose'];
    super.initState();
  }

  Widget buildSwitchListTile(
      String title, String subtitle, var settingValue, Function updateValue) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        value: settingValue,
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selecetedFilter = {
                  'gluten': _glutenFree,
                  'lactose': _lactoesFree,
                  'vegen': _vegen,
                  'vegetarian': _vegentarian,
                };
                widget.saveFilter(selecetedFilter);
              })
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust Meal Selection',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
            ),
          ),
          Expanded(
              child: ListView(
            children: <Widget>[
              buildSwitchListTile(
                  'Gluten Free', 'Only include Gluten-Free Meal', _glutenFree,
                  (newvalue) {
                setState(() {
                  _glutenFree = newvalue;
                });
              }),
              buildSwitchListTile(
                  'Latoes Free', 'Only include Latoes-Free Meal', _lactoesFree,
                  (newvalue) {
                setState(() {
                  _lactoesFree = newvalue;
                });
              }),
              buildSwitchListTile(
                  'Vegantable', 'Only include Vegantable Meal', _vegen,
                  (newvalue) {
                setState(() {
                  _vegen = newvalue;
                });
              }),
              buildSwitchListTile(
                  'Vegentarian', 'Only include Vegentarian', _vegentarian,
                  (newvalue) {
                setState(() {
                  _vegentarian = newvalue;
                });
              }),
            ],
          ))
        ],
      ),
    );
  }
}
