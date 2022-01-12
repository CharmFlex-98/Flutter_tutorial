import 'package:flutter/material.dart';
import 'package:meal_app/screens/categoriesScreen.dart';
import 'package:meal_app/screens/mealDetailScreen.dart';
import 'package:meal_app/screens/mealScreen.dart';
import 'package:meal_app/screens/tabScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        canvasColor: const Color.fromRGBO(80, 100, 100, 50),
      ),
      home: const TabScreen(),
      routes: {
        MealScreen.routeName: (_) => MealScreen(),
        MealDetailScreen.routeName: (_) => MealDetailScreen()
      },
      // onGenerateRoute: (setting) {
      //   print(setting.arguments);
      //   return MaterialPageRoute(builder: (_) => CategoriesScreen());
      // },
    );
  }
}
