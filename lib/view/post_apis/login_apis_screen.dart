import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class LoginAPIsScreen extends StatefulWidget {
  const LoginAPIsScreen({super.key});

  @override
  State<LoginAPIsScreen> createState() => _LoginAPIsScreenState();
}

class _LoginAPIsScreenState extends State<LoginAPIsScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  void login(String email, password) async {
    try {
      Response response = await post(
          Uri.parse('https://reqres.in/api/register'),
          body: {'email': email, 'password': password});
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data['id']);
        print('account created successfully');
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade100,
        centerTitle: true,
        title:
            const Text('Login Reg API', style: TextStyle(color: Colors.blue)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(hintText: 'Enter email'),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(hintText: 'Enter password'),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  login(emailController.text.toString(),
                      passwordController.text.toString());
                },
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Center(
                    child: Text("Register"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
