// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import 'package:meals/models/meals_model.dart';
import 'package:meals/widgets/meal_item_trait.dart';

class MealItem extends StatelessWidget {
  const MealItem({Key? key, required this.meal, required this.ontap})
      : super(key: key);
  final Meal meal;
  final void Function() ontap;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap:ontap,
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(
                meal.imageUrl,
              ),
              fit: BoxFit.cover,
              height: 250,
              width: double.infinity,
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.black54,
                  ),
                  child: Column(children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealTrait(
                            icon: Icons.schedule,
                            label: ' ${meal.duration.toString()} minutes'),
                        const SizedBox(
                          width: 12,
                        ),
                        MealTrait(
                            icon: Icons.work,
                            label: meal.complexity.name[0].toUpperCase() +
                                meal.complexity.name.substring(1)),
                        const SizedBox(
                          width: 12,
                        ),
                        MealTrait(
                            icon: Icons.attach_money,
                            label: meal.affordability.name[0].toUpperCase() +
                                meal.affordability.name.substring(1))
                      ],
                    )
                  ]),
                ))
          ],
        ),
      ),
    );
  }
}
