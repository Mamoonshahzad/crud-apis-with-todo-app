import 'package:flutter/material.dart';

import '../../widgets/home_screen_widget.dart';
import 'first_tutorial_screen.dart';

class ApiCalls extends StatelessWidget {
  const ApiCalls({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade100,
        centerTitle: true,
        title: const Text('New Course'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              HomeScreenWidget(
                  color: Colors.grey,
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FirstTutorialScreen())),
                  buttonText: 'First Tutorial Screen'),
              HomeScreenWidget(
                  color: Colors.red.shade100,
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FirstTutorialScreen())),
                  buttonText: 'Improved Code')
            ],
          ),
        ),
      ),
    );
  }
}
