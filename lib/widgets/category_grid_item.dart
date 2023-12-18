import 'package:flutter/material.dart';
import 'package:cook_it_up/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({super.key, required this.category});

  final Category category;
  @override
  Widget build(BuildContext context) {
    return Text(
      category.title,
      textAlign: TextAlign.center,
      style: const TextStyle(color: Colors.white),
    );
  }
}
