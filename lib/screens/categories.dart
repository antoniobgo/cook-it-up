import 'package:cook_it_up/models/category.dart';
import 'package:cook_it_up/screens/meals.dart';
import 'package:cook_it_up/widgets/category_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:cook_it_up/data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  // final categories = List.of(availableCategories);

  void _selectCategory(BuildContext context, Category category) {
    final categoryMeals =
        dummyMeals.where((meal) => meal.categories.contains(category.id));
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) =>
            MealsScreen(title: category.title, meals: categoryMeals.toList()),
      ),
    );
    // Navigator.push(context, route)
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          ...availableCategories.map((category) => CategoryGridItem(
                category: category,
                onSelectCategory: () {
                  _selectCategory(context, category);
                },
              ))
        ]);
  }
}
