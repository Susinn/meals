// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:meals/models/meals_model.dart';
import 'package:meals/screens/meals_detail_page.dart';
import 'package:meals/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    Key? key,
    this.title,
    required this.meals,
    
  }) : super(key: key);
  final String? title;
  final List<Meal> meals;
  
  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealItem(
            meal: meals[index],
            ontap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MealsDetailPage(meal: meals[index]),
                ),
              );
            }));
    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "uh oh ... No Items Here",
              style: TextStyle(
                  fontSize: Theme.of(context).textTheme.headlineLarge?.fontSize,
                  color: Theme.of(context).colorScheme.onBackground),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      );
    }
    if (title == null) {
      return Scaffold(
        body: content,
      );
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: content);
  }
}
