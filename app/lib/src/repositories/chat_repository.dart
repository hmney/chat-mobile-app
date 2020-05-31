import 'package:app/src/models/chat_model.dart';
import 'package:app/src/models/message_model.dart';
import 'package:app/src/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatRepository {
  final Firestore _db = Firestore.instance;

  Future<QuerySnapshot> getUserByEmail(String inputField) async {
    return (_db
        .collection('users')
        .where('email', isEqualTo: inputField)
        .getDocuments());
  }

  Future<String> createNewContact(
      UserModel selfUser, UserModel otherUser) async {
    String _chatId;

    _chatId = await getChatId(selfUser, otherUser);
    if (_chatId == null) {
      await _db.collection("chats").add({
        'user1Id': selfUser.uid,
        'user2Id': otherUser.uid,
      }).then((value) {
        _chatId = value.documentID;
      });
      await _db
          .collection("users")
          .document(selfUser.uid)
          .collection("contacts")
          .document(otherUser.uid)
          .setData({
        'uid': otherUser.uid,
        'username': otherUser.username,
        'email': otherUser.email,
        'chat_id': _chatId
      });
      await _db
          .collection("users")
          .document(otherUser.uid)
          .collection("contacts")
          .document(selfUser.uid)
          .setData({
        'uid': selfUser.uid,
        'username': selfUser.username,
        'email': selfUser.email,
        'chat_id': _chatId
      });
    }
    return _chatId;
  }

  Future<String> getChatId(UserModel selfUser, UserModel otherUser) async {
    String _chatId;

    await _db
        .collection("users")
        .document(selfUser.uid)
        .collection("contacts")
        .document(otherUser.uid)
        .get()
        .then((value) {
      if (value.exists)
        _chatId = value.data['chat_id'];
    });
    return _chatId;
  }

  Future<Stream<QuerySnapshot>> getChatMessages(String chatId) async {
    try {
      var result = _db
          .collection("chats")
          .document(chatId)
          .collection("messages")
          .orderBy('time', descending: true)
          .limit(20)
          .snapshots();
      return result;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<void> postMessage(String chatId, MessageModel message) async {
    await _db
        .collection("chats")
        .document(chatId)
        .collection("messages")
        .add(message.toJson());
  }
}
