import 'package:app/src/models/message_model.dart';
import 'package:app/src/models/user_model.dart';

class ContactModel {
  String chatId;
  UserModel contactDetails;
  MessageModel lastMessage;

  ContactModel({
    this.chatId,
    this.contactDetails,
    this.lastMessage,
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      chatId: json['chat_id'],
      contactDetails: UserModel.fromJson(json['contact_details']),
      lastMessage: (json['last_message'] != null) ? MessageModel.fromJson(json['last_message']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'chat_id': chatId,
        'contact_details': contactDetails.toJson(),
        'last_message': (lastMessage != null) ?lastMessage.toJson() : null,
      };
}
