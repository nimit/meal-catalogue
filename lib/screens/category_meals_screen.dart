import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> _availableMeals;
  CategoryMealsScreen(this._availableMeals);
  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String _categoryTitle;
  List<Meal> _displayMeals;

  @override
  void didChangeDependencies() {
    //Used in place of initState bcoz you cannot use context in initState
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    _categoryTitle = routeArgs['title'];
    _displayMeals = widget._availableMeals
        .where((meal) => meal.categories.contains(categoryId))
        .toList();
    super.didChangeDependencies();
  }

  // void _removeMeal(String mealId) {
  //   setState(() {
  //     _displayMeals.removeWhere((meal) => meal.id == mealId);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_categoryTitle)),
      body: Container(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: _displayMeals[index].id,
              title: _displayMeals[index].title,
              imageUrl: _displayMeals[index].imageUrl,
              duration: _displayMeals[index].duration,
              complexity: _displayMeals[index].complexity,
              affordability: _displayMeals[index].affordability,
            );
          },
          itemCount: _displayMeals.length,
        ),
      ),
    );
  }
}
