import 'package:flutter/material.dart';
import 'package:meal_app/widgets/categoryItem.dart';
import 'package:meal_app/dummyData.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: GridView(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for (var data in DUMMY_CATEGORIES)
            CategoryItem(data.id, data.title, data.color)
        ],
      ),
    );
  }
}
