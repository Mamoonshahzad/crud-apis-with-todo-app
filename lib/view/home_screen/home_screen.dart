import 'package:api_practice_course/Models/upc_products.dart';
import 'package:api_practice_course/view/get_apis/get_apis_categories_screen.dart';
import 'package:api_practice_course/view/new_course/api_calls_screen.dart';
import 'package:api_practice_course/view/post_apis/post_apis_categories_screen.dart';
import 'package:api_practice_course/widgets/home_screen_widget.dart';
import 'package:flutter/material.dart';

import '../todo_app_screens/todo_app_main_screen.dart';

import '../todo_app_screens/todo_app_main_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade100,
        centerTitle: true,
        title: const Text('Home Screen', style: TextStyle(color: Colors.blue)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HomeScreenWidget(
                    color: Colors.black54,
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const GetAPIsCategoriesScreen())),
                    buttonText: "Get APIs"),
                const SizedBox(height: 20),
                HomeScreenWidget(
                    color: Colors.greenAccent,
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const PostAPIsCategoriesScreen())),
                    buttonText: "Post APIs"),
                const SizedBox(height: 20),
                HomeScreenWidget(
                    color: Colors.grey,
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ApiCalls())),
                    buttonText: 'New Course'),
                const SizedBox(height: 20),
                HomeScreenWidget(
                    color: Colors.lightBlueAccent.shade100,
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TodoAppMainScreen())),
                    buttonText: 'To Do App')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
