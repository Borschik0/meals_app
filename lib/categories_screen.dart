import 'package:flutter/material.dart';
import 'package:meals_app/category_item.dart';

import './dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DeliMeal'),),
      body: GridView(
          children: DUMMY_CATEGORIES
              .map((categoryData) =>
                  CategoryItem(categoryData.title, categoryData.color))
              .toList(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 1.5,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20)),
    );
  }
}
