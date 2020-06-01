import 'package:app/src/models/user_model.dart';

class ChatModel {
  UserModel user1;
  UserModel user2;

  ChatModel({this.user1, this.user2});

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      user1: UserModel.fromJson(json['user1']),
      user2: UserModel.fromJson(json['user2']),
    );
  }

  Map<String, dynamic> toJson() => {
    'user1': user1.toJson(),
    'user2': user2.toJson(),
  };
}
