import 'package:app/src/models/user_model.dart';

class ContactModel {
  String chatId;
  UserModel contactDetails;

  ContactModel({
    this.chatId,
    this.contactDetails,
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      chatId: json['chat_id'],
      contactDetails: UserModel.fromJson(json['contact_details']),
    );
  }

  Map<String, dynamic> toJson() => {
        'chat_id': chatId,
        'contact_details': contactDetails.toJson(),
      };
}
