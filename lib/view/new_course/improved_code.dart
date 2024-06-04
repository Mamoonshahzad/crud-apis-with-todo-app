// import 'package:api_practice_course/services/random_user_api_services.dart';
// import 'package:flutter/material.dart';
// import '../../Models/random_user_model.dart';
//
// class ImprovedCode extends StatefulWidget {
//   const ImprovedCode({super.key});
//
//   @override
//   ImprovedCodeState createState() => ImprovedCodeState();
// }
//
// class ImprovedCodeState extends State<ImprovedCode> {
//   List<RandomUserModel> users = [];
//
//   @override
//   void initState() {
//     super.initState();
//     fetchUsers();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text('First Tutorial Screen'),
//       ),
//       body: ListView.builder(
//         itemCount: users.length,
//         itemBuilder: (context, index) {
//           final user = users[index];
//           final email = user.email;
//           return ListTile(
//             leading: ClipRRect(
//                 borderRadius: BorderRadius.circular(100),
//                 child: Image.network(user.picture.large)),
//             subtitle: Text(email),
//             title: Text(user.name.first),
//           );
//         },
//       ),
//     );
//   }
//
//   Future<void> fetchUsers() async {
//     final response = await RandomUserApiServices.fetchUsers();
//     setState(() {
//       users = response;
//     });
//   }
//
//   // Future<void> fetchUsers() async {
//   //   print('called fetchUsers');
//   //   const url = 'https://randomuser.me/api/?results=100';
//   //   final uri = Uri.parse(url);
//   //   final response = await http.get(uri);
//   //   final body = response.body;
//   //   final json = jsonDecode(body);
//   //   final results = json['results'] as List<dynamic>;
//   //   setState(() {
//   //     final transformed = results.map((e) {
//   //       final name = UserName(
//   //           title: e['name']['title'],
//   //           first: e['name']['first'],
//   //           last: e['name']['last']);
//   //       final picture = UserImage(
//   //           medium: e['picture']['thumbnail'],
//   //           thumbnail: e['picture']['large'],
//   //           large: e['picture']['medium']);
//   //       return RandomUserModel(
//   //         gender: e['gender'],
//   //         email: e['email'],
//   //         phone: e['phone'],
//   //         cell: e['cell'],
//   //         nat: e['nat'],
//   //         name: name,
//   //         picture: picture,
//   //       );
//   //     }).toList();
//   //     users = transformed;
//   //   });
//   //   print('fetchUsers completed');
//   // }
// }
