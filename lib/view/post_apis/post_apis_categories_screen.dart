import 'package:api_practice_course/view/post_apis/login_apis_screen.dart';
import 'package:api_practice_course/view/post_apis/upload_image.dart';
import 'package:api_practice_course/widgets/home_screen_widget.dart';
import 'package:flutter/material.dart';

class PostAPIsCategoriesScreen extends StatelessWidget {
  const PostAPIsCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade100,
        centerTitle: true,
        title: const Text('Post APIs Categories',
            style: TextStyle(color: Colors.blue)),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HomeScreenWidget(
                color: Colors.blueGrey,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginAPIsScreen()));
                },
                buttonText: "Login Reg Api"),
            const SizedBox(height: 20),
            HomeScreenWidget(
                color: Colors.red.shade100,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UploadImage()));
                },
                buttonText: 'Upload Image')
          ],
        ),
      ),
    );
  }
}
