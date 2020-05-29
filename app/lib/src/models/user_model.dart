import 'package:flutter/cupertino.dart';

class UserModel {
  String username;
  String email;
  String password;
  String picture;

  UserModel({
    @required this.username,
    @required this.email,
    @required this.password,
    this.picture,
  });
}
