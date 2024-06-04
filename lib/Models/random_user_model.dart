import 'package:api_practice_course/Models/user_name.dart';

class RandomUserModel {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final UserName name;
  final UserImage picture;

  RandomUserModel(
      {required this.gender,
      required this.email,
      required this.phone,
      required this.cell,
      required this.nat,
      required this.name,
      required this.picture});
}

class UserImage {
  final String thumbnail;
  final String large;
  final String medium;

  UserImage(
      {required this.medium, required this.thumbnail, required this.large});
}
