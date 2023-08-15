// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meals_model.dart';
import 'package:meals/providers/favourite_provider.dart';

class MealsDetailPage extends ConsumerWidget {
  const MealsDetailPage({
    Key? key,
    required this.meal,
  }) : super(key: key);
  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favouriteMeals = ref.watch(favouriteProvider);
    final isvisible = favouriteMeals.contains(meal);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              final isFav = ref
                  .read(favouriteProvider.notifier)
                  .toggleFavouriteStatus(meal);

              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: isFav
                        ? const Text('meal added to favourites')
                        : const Text('meal removed from favourites')),
              );
            },
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return RotationTransition(
                  turns: Tween(begin: 0.5,end:1.0).animate(animation), 
                  child: child
                  );
              },
              child: Icon(isvisible ? Icons.star : Icons.star_border,key: ValueKey(isvisible)),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: meal.id,
              child: Image.network(meal.imageUrl)),
            const SizedBox(
              height: 20,
            ),
            Text("Ingredients",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize:
                        Theme.of(context).textTheme.headlineMedium?.fontSize)),
            const SizedBox(
              height: 10,
            ),
            for (final ingredients in meal.ingredients)
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text(
                  ingredients,
                  style: const TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            const SizedBox(
              height: 20,
            ),
            Text("Steps",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize:
                        Theme.of(context).textTheme.headlineMedium?.fontSize)),
            const SizedBox(
              height: 10,
            ),
            for (final steps in meal.steps)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                child: Text(
                  steps,
                  style: const TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
