// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MealTrait extends StatelessWidget {
  const MealTrait({
    Key? key,
    required this.icon,
    required this.label,
  }) : super(key: key);
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,color: Colors.white,),
        const SizedBox(width: 3,),
        Text(label,style: const TextStyle(color: Colors.white),)
      ],
    );
  }
}
