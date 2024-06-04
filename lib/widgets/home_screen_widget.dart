import 'package:flutter/material.dart';

class HomeScreenWidget extends StatelessWidget {
  final Color color;
  final VoidCallback onTap;
  final String buttonText;

  const HomeScreenWidget({
    super.key,
    required this.color,
    required this.onTap,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.height * 0.15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: color,
            ),
            child: Center(
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        textAlign: TextAlign.center,
                        buttonText,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black87))))));
  }
}
