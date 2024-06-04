import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../Models/users_model.dart';

class UsersApiScreen extends StatefulWidget {
  const UsersApiScreen({super.key});

  @override
  State<UsersApiScreen> createState() => _UsersApiScreenState();
}

class _UsersApiScreenState extends State<UsersApiScreen> {
  List<UsersModel> usersList = [];
  Future<List<UsersModel>> getUsersApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        usersList.add(UsersModel.fromJson(i));
      }
      return usersList;
    } else {
      return usersList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade100,
        centerTitle: true,
        title: const Text('Users Api Screen',
            style: TextStyle(color: Colors.blue)),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
            future: getUsersApi(),
            builder: (context, AsyncSnapshot<List<UsersModel>> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                    itemCount: usersList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: Column(
                            children: [
                              ReusableRow(
                                  title: 'Name',
                                  value: snapshot.data![index].name.toString()),
                              ReusableRow(
                                  title: 'User Name',
                                  value: snapshot.data![index].username
                                      .toString()),
                              ReusableRow(
                                  title: 'email',
                                  value:
                                      snapshot.data![index].email.toString()),
                              ReusableRow(
                                  title: 'Address',
                                  value: snapshot.data![index].address!.city
                                      .toString()),
                            ],
                          ),
                        ),
                      );
                    });
              }
            },
          ))
        ],
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  final String title, value;
  const ReusableRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(value),
        ],
      ),
    );
  }
}
