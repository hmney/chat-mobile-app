import 'package:app/src/models/contact_model.dart';
import 'package:app/src/models/message_model.dart';
import 'package:app/src/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatRepository {
  final Firestore _db = Firestore.instance;

  Future<UserModel> getUserByEmail(String inputField) async {
    UserModel user;
    try {
      await _db
          .collection('users')
          .where('email', isEqualTo: inputField)
          .getDocuments()
          .then((value) {
        if (value.documents.isNotEmpty) {
          user = UserModel.fromJson(value.documents[0].data);
        }
      });
      return user;
    } catch (e) {
      return null;
    }
  }

  Future<ContactModel> createNewContact(
      UserModel selfUser, UserModel otherUser) async {
    ContactModel contact;

    try {
      await getContact(selfUser, otherUser).then((value) async {
        contact = value;
        print(contact);
        if (value == null) {
          await _db.collection("chats").add({
            'user1': selfUser.toJson(),
            'user2': otherUser.toJson(),
          }).then((value) async {
            var _chatId = value.documentID;
            var contactInfo =
                ContactModel(chatId: _chatId, contactDetails: otherUser);
            await _db
                .collection("users")
                .document(selfUser.uid)
                .collection("contacts")
                .document(otherUser.uid)
                .setData(contactInfo.toJson());
            await _db
                .collection("users")
                .document(otherUser.uid)
                .collection("contacts")
                .document(selfUser.uid)
                .setData(ContactModel(chatId: _chatId, contactDetails: selfUser)
                    .toJson());
            contact = contactInfo;
          });
        }
      });
      return contact;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<ContactModel> getContact(
      UserModel selfUser, UserModel otherUser) async {
    ContactModel contact;
    try {
      await _db
          .collection("users")
          .document(selfUser.uid)
          .collection("contacts")
          .document(otherUser.uid)
          .get()
          .then((value) {
        if (value.exists) {
          contact = ContactModel.fromJson(value.data);
        }
      });
      print(contact);
      return contact;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Stream<QuerySnapshot> getChatMessages(String chatId) {
    try {
      return _db
          .collection("chats")
          .document(chatId)
          .collection("messages")
          .orderBy('time', descending: true)
          .snapshots();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Stream<QuerySnapshot> getAllMessages(String uid) {
    try {
      return _db
          .collection("users")
          .document(uid)
          .collection("contacts")
          .snapshots();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> postMessage(ContactModel contact, String thisUid, String chatId,
      MessageModel message) async {
    await _db
        .collection("chats")
        .document(chatId)
        .collection("messages")
        .add(message.toJson());

    // await _db
    //     .collection("users")
    //     .document(thisUid)
    //     .collection("contacts")
    //     .document(contact?.contactDetails?.uid)
    //     .setData({'last_message': message.toJson()}, merge: true);
    // await _db
    //     .collection("users")
    //     .document(contact?.contactDetails?.uid)
    //     .collection("contacts")
    //     .document(thisUid)
    //     .setData({'last_message': message.toJson()}, merge: true);
  }
}
