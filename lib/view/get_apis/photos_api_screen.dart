import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PhotosAPIScreen extends StatefulWidget {
  const PhotosAPIScreen({super.key});

  @override
  State<PhotosAPIScreen> createState() => _PhotosAPIScreenState();
}

class _PhotosAPIScreenState extends State<PhotosAPIScreen> {
  List<Photos> photosList = [];
  Future<List<Photos>> getPhotos() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        Photos photos = Photos(title: i['title'], url: i['url'], id: i['id']);
        photosList.add(photos);
      }
      return photosList;
    } else {
      return photosList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade100,
        centerTitle: true,
        title: const Text('Photos Api Screen',
            style: TextStyle(color: Colors.blue)),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
            future: getPhotos(),
            builder: (context, AsyncSnapshot<List<Photos>> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                    itemCount: photosList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              snapshot.data![index].url.toString()),
                        ),
                        subtitle: Text(snapshot.data![index].title.toString()),
                        title: Text('Notes id: ${snapshot.data![index].id}'),
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

//Photos API model as per it's json file in the json placeholder website of the api
class Photos {
  String title, url;
  int id;
  Photos({required this.title, required this.url, required this.id});
}
