import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget listTileBuilder(String title, IconData data, Function click) {
    return ListTile(
      leading: CircleAvatar(
        child: Icon(
          data,
          size: 26,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      onTap: click,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(height: 20),
          listTileBuilder(
            'Categories',
            Icons.restaurant,
            () => Navigator.pushReplacementNamed(context, '/home2'),
          ),
          SizedBox(height: 5),
          listTileBuilder(
            'Filters',
            Icons.settings,
            () => Navigator.pushReplacementNamed(
                context, FiltersScreen.routeName),
          ),
        ],
      ),
    );
  }
}
