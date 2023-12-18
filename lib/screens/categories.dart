import 'package:cook_it_up/widgets/category_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:cook_it_up/data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});

  final categories = List.of(availableCategories);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick your category'),
      ),
      body: GridView(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: [
            ...categories
                .map((category) => CategoryGridItem(category: category))
          ]),
    );
  }
}
