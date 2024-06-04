import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UpcProducts extends StatefulWidget {
  const UpcProducts({super.key});

  @override
  State<UpcProducts> createState() => _UpcProductsState();
}

class _UpcProductsState extends State<UpcProducts> {
  Future<List<String>> fetchData() async {
    var url =
        Uri.parse('https://big-product-data.p.rapidapi.com/gtin/850028009338');
    var headers = {
      'X-RapidAPI-Key': '0ba8a5acbbmsh6643695a64ce672p163d97jsn5487890c4472',
      'X-RapidAPI-Host': 'big-product-data.p.rapidapi.com',
    };

    try {
      var response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        // Parse the JSON response
        var jsonData = json.decode(response.body);
        // Extract titles from the response
        List<String> titles = [];
        for (var item in jsonData) {
          titles.add(item['title']);
        }
        return titles;
      } else {
        throw 'Request failed with status: ${response.statusCode}';
      }
    } catch (error) {
      throw 'Request failed with error: $error';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('UPC Data'),
      ),
      body: FutureBuilder(
        future: fetchData(),
        builder: (context, AsyncSnapshot<List<String>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            // Display the list of titles in a ListView
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index]),
                );
              },
            );
          }
        },
      ),
    );
  }
}
