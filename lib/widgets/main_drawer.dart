import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key, required this.onSelectPage}) : super(key: key);
  final void Function(String identifier) onSelectPage;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context)
                    .colorScheme
                    .primaryContainer
                    .withOpacity(0.33),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              child: Row(
                children: [
                  const Icon(
                    Icons.fastfood,
                    size: 48,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Text(
                    'COOKING UP !',
                    style: TextStyle(
                            fontSize: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.fontSize)
                        .copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  )
                ],
              )),
          ListTile(
            title: Text("Meals",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 24)),
            leading: Icon(
              Icons.restaurant,
              size: 26,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            onTap: () {
              onSelectPage('meals');
            },
          ),
          ListTile(
            title: Text("Filters",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 24)),
            leading: Icon(
              Icons.settings,
              size: 26,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            onTap: () {
              onSelectPage("filters");
            },
          ),
        ],
      ),
    );
  }
}
