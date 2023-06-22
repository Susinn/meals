// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';


import '../models/category.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({
    Key? key,
    required this.category,
    required this.ontap,
  }) : super(key: key);
  final Category category;
  final void Function() ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(colors: [
            category.color.withOpacity(0.25),
            category.color.withOpacity(0.85)
          ], begin: Alignment.bottomLeft, end: Alignment.topRight),
        ),
        child: Text(
          category.title,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
