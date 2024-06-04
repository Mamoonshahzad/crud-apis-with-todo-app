import 'dart:convert';

import '../Models/random_user_model.dart';
import '../Models/user_name.dart';
import 'package:http/http.dart' as http;

class RandomUserApiServices {
  Future<List<RandomUserModel>> fetchUsers() async {
    print('called fetchUsers');
    const url = 'https://randomuser.me/api/?results=100';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final users = results.map((e) {
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
    return users;
  }
}
