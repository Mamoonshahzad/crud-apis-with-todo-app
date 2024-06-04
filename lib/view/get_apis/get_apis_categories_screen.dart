import 'package:api_practice_course/view/get_apis/photos_api_screen.dart';
import 'package:api_practice_course/view/get_apis/text_api_screen.dart';
import 'package:api_practice_course/view/get_apis/users_api_screen.dart';
import 'package:api_practice_course/view/get_apis/without_model_api_calls_screen.dart';
import 'package:flutter/material.dart';

import '../../widgets/home_screen_widget.dart';

class GetAPIsCategoriesScreen extends StatefulWidget {
  const GetAPIsCategoriesScreen({super.key});

  @override
  State<GetAPIsCategoriesScreen> createState() =>
      _GetAPIsCategoriesScreenState();
}

class _GetAPIsCategoriesScreenState extends State<GetAPIsCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade100,
        centerTitle: true,
        title: const Text('Get APIs Categories',
            style: TextStyle(color: Colors.blue)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HomeScreenWidget(
                color: Colors.blueGrey.shade100,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TextAPIScreen()));
                },
                buttonText: 'Text Api'),
            const SizedBox(height: 20),
            HomeScreenWidget(
                color: Colors.grey,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PhotosAPIScreen()));
                },
                buttonText: 'Photos Api'),
            const SizedBox(height: 20),
            HomeScreenWidget(
                color: Colors.yellow.shade100,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UsersApiScreen()));
                },
                buttonText: 'Users API'),
            const SizedBox(height: 20),
            HomeScreenWidget(
                color: Colors.greenAccent.shade100,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const WithoutModelApiCallsScreen()));
                },
                buttonText: 'Model Less Calls'),
          ],
        ),
      ),
    );
  }
}
