import 'package:flutter/material.dart'; //It is used to get the class Color.

class Category {
  //Not a widget.
  final id;
  final String title;
  final Color color;

  const Category({
    @required this.id,
    @required this.title,
    this.color = Colors.orange,
  });
}
