import 'package:cook_it_up/screens/meals.dart';
import 'package:cook_it_up/widgets/category_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:cook_it_up/data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});

  final categories = List.of(availableCategories);

  void _selectCategory(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const MealsScreen(title: 'some title', meals: []),
      ),
    );
    // Navigator.push(context, route)
  }

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
            ...categories.map((category) => CategoryGridItem(
                  category: category,
                  onSelectCategory: () {
                    _selectCategory(context);
                  },
                ))
          ]),
    );
  }
}
