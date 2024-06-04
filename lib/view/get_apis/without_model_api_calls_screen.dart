import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../widgets/reusabel_row_widget.dart';

class WithoutModelApiCallsScreen extends StatefulWidget {
  const WithoutModelApiCallsScreen({super.key});

  @override
  State<WithoutModelApiCallsScreen> createState() =>
      _WithoutModelApiCallsScreenState();
}

class _WithoutModelApiCallsScreenState
    extends State<WithoutModelApiCallsScreen> {
  var data;
  Future<void> getUserApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade100,
        centerTitle: true,
        title: const Text('Without Model Api Calls',
            style: TextStyle(color: Colors.blue)),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                  future: getUserApi(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Column(
                              children: [
                                ReusableRow(
                                    title: 'name',
                                    value: data[index]['name'].toString()),
                                ReusableRow(
                                    title: 'User Name',
                                    value: data[index]['username'].toString()),
                                ReusableRow(
                                    title: 'Geo Location',
                                    value: data[index]['address']['geo']
                                        .toString())
                              ],
                            ),
                          );
                        });
                  }))
        ],
      ),
    );
  }
}
