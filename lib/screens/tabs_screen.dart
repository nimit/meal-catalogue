import 'package:flutter/material.dart';

import 'categories_screen.dart';
import 'favorites_screen.dart';
import '../widgets/main_drawer.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final bool start;
  final List<Meal> _favoriteMeals;
  TabsScreen(this._favoriteMeals, {this.start = false});
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    _pages = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {'page': FavoritesScreen(widget._favoriteMeals), 'title': 'My Favorites'},
    ];
    if (widget.start) _selectedIndex = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(_pages[_selectedIndex]['title']),
      ),
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        // selectedItemColor: Theme.of(context).accentColor,
        selectedItemColor: Color.fromRGBO(98, 233, 30, 1),
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category_outlined),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.favorite_outline_sharp),
            label: 'Favorites',
          )
        ],
      ),
    );
  }
}

//This build method creates a tabbar in the appbar itself.

// Widget build(BuildContext context) {
//   return DefaultTabController(
//     length: 2,
//     // initialIndex: 1,
//     child: Scaffold(
//       appBar: AppBar(
//         title: Text('Meals'),
//         bottom: TabBar(
//           tabs: [Tab(icon: Icon(Icons.category_outlined), text: 'Categories'),
//             Tab(icon: Icon(Icons.favorite_outline_sharp), text: 'Favorites'),
//           ],
//         ),
//       ),
//       body: TabBarView(
//         children: [
//           CategoriesScreen(),
//           FavoritesScreen(),
//         ],
//       ),
//     ),
//   );
// }
