import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../Models/random_user_model.dart';
import '../../Models/user_name.dart';

class FirstTutorialScreen extends StatefulWidget {
  const FirstTutorialScreen({super.key});

  @override
  FirstTutorialScreenState createState() => FirstTutorialScreenState();
}

class FirstTutorialScreenState extends State<FirstTutorialScreen> {
  List<RandomUserModel> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('First Tutorial Screen'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fetchUsers();
        },
        child: const Icon(Icons.refresh),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          final email = user.email;
          return ListTile(
            leading: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(user.picture.large)),
            subtitle: Text(email),
            title: Text(user.name.first),
          );
        },
      ),
    );
  }

  void fetchUsers() async {
    print('called fetchUsers');
    const url = 'https://randomuser.me/api/?results=100';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    setState(() {
      final transformed = results.map((e) {
        final name = UserName(
            title: e['name']['title'],
            first: e['name']['first'],
            last: e['name']['last']);
        final picture = UserImage(
            medium: e['picture']['thumbnail'],
            thumbnail: e['picture']['large'],
            large: e['picture']['medium']);
        return RandomUserModel(
          gender: e['gender'],
          email: e['email'],
          phone: e['phone'],
          cell: e['cell'],
          nat: e['nat'],
          name: name,
          picture: picture,
        );
      }).toList();
      users = transformed;
    });
    print('fetchUsers completed');
  }
}
