import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Map<String, bool> _currentFilters;
  final Function _saveFilters;
  FiltersScreen(this._currentFilters, this._saveFilters);
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget._currentFilters['gluten'];
    _vegetarian = widget._currentFilters['vegetarian'];
    _vegan = widget._currentFilters['vegan'];
    _lactoseFree = widget._currentFilters['lactose'];
    super.initState();
  }

  Widget _switchListTileBuilder(String title, bool value, Function onPress) {
    return SwitchListTile.adaptive(
      title: Text(title),
      value: value,
      subtitle: Text(
        'Only include ${title.substring(0, 1).toLowerCase() + title.substring(1)} meals',
      ),
      onChanged: onPress,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () => widget._saveFilters({
              'gluten': _glutenFree,
              'vegetarian': _vegetarian,
              'vegan': _vegan,
              'lactose': _lactoseFree,
            }),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _switchListTileBuilder(
                  'Gluten-free',
                  _glutenFree,
                  (newValue) {
                    setState(() => _glutenFree = newValue);
                  },
                ),
                _switchListTileBuilder(
                  'Vegetarian',
                  _vegetarian,
                  (newValue) {
                    setState(() => _vegetarian = newValue);
                  },
                ),
                _switchListTileBuilder(
                  'Vegan',
                  _vegan,
                  (newValue) {
                    setState(() => _vegan = newValue);
                  },
                ),
                _switchListTileBuilder(
                  'Lactose-free',
                  _lactoseFree,
                  (newValue) {
                    setState(() => _lactoseFree = newValue);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
