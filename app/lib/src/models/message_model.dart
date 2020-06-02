import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  String content;
  String senderId;
  Timestamp time;

  MessageModel({this.content, this.senderId, this.time});

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      content: json['content'],
      senderId: json['sender_id'],
      time: json['time'],
    );
  }

  static List<MessageModel> fromJsonArray(List jsonArray) {
    return jsonArray?.map((item) {
      return MessageModel.fromJson(item);
    })?.toList();
  }

  Map<String, dynamic> toJson() => {
        'content': content,
        'sender_id': senderId,
        'time': FieldValue.serverTimestamp(),
      };
}
