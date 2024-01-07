import 'package:cook_it_up/models/category.dart';
import 'package:cook_it_up/models/meal.dart';
import 'package:cook_it_up/screens/meals.dart';
import 'package:cook_it_up/widgets/category_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:cook_it_up/data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen(
      {super.key, required this.onToggleFavorite, required this.avalableMeals});

  // final categories = List.of(availableCategories);
  final void Function(Meal meal) onToggleFavorite;
  final List<Meal> avalableMeals;

  void _selectCategory(BuildContext context, Category category) {
    final categoryMeals =
        avalableMeals.where((meal) => meal.categories.contains(category.id));
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: categoryMeals.toList(),
          onToggleFavorite: onToggleFavorite,
        ),
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
