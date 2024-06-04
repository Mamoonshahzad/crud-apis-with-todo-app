import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../Models/PostModel.dart';

class TextAPIScreen extends StatefulWidget {
  const TextAPIScreen({super.key});

  @override
  State<TextAPIScreen> createState() => _TextAPIScreenState();
}

class _TextAPIScreenState extends State<TextAPIScreen> {
  List<PostModel> postList = [];
  Future<List<PostModel>> getPostApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      postList.clear();
      for (Map i in data) {
        postList.add(PostModel.fromJson(i));
      }
      return postList;
    } else {
      return postList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor: Colors.yellow.shade100,
        centerTitle: true,
        title:
            const Text('Text Api Screen', style: TextStyle(color: Colors.blue)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                  future: getPostApi(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return ListView.builder(itemBuilder: (context, index) {
                        return Card(
                          color: Colors.blue.shade50,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 3),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Title',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                                Text(postList[index].title.toString()),
                                const SizedBox(height: 5),
                                const Text('Description',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                                Text(postList[index].body.toString())
                              ],
                            ),
                          ),
                        );
                      });
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}
