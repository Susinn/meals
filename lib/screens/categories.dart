// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_grid_item_widget.dart';

import '../models/meals_model.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key, required this.availabaleMeals})
      : super(key: key);

  final List<Meal> availabaleMeals;
  void _selectCategory(BuildContext context, Category category) {
    final filteredmeals = availabaleMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MealsScreen(
                  title: category.title,
                  meals: filteredmeals,
                  
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20),
        children: [
          for (final category in availableCategories)
            CategoryGrid(
              category: category,
              ontap: () {
                _selectCategory(context, category);
              },
            )
          // ...availableCategories.map((e) => CategoryGrid(category: e)).toList()
        ],
      ),
    );
  }
}
