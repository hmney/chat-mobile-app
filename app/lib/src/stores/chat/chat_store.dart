import 'package:app/src/models/contact_model.dart';
import 'package:app/src/models/message_model.dart';
import 'package:app/src/models/user_model.dart';
import 'package:app/src/repositories/chat_repository.dart';
import 'package:app/src/repositories/user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

part 'chat_store.g.dart';

class ChatStore = _ChatStore with _$ChatStore;

abstract class _ChatStore with Store {
  final ChatRepository _chatRepository = ChatRepository();
  final UserRepository _userRepository = UserRepository();

  @observable
  String message = '';

  @observable
  String thisUid;

  @observable
  String thisUsername;

  @observable
  String senderUid;

  @computed
  bool get checkSenderUid => senderUid == thisUid;

  @action
  setThisUsername(String value) => thisUsername = value;
  @action
  setThisUid(String value) => thisUid = value;

  @action
  setSenderUid(String value) => senderUid = value;

  @action
  Future<void> getThisUid() async {
    String thisUid;

    try {
      thisUid = await _userRepository.getUserUid();
      setThisUid(thisUid);
    } catch (e) {
      print(e);
    }
  }

  @action
  Stream<QuerySnapshot> getChatMessages(String chatId) {
    try {
      return _chatRepository.getChatMessages(chatId);
    } catch (error) {
      return null;
    }
  }

  @action
  Stream<QuerySnapshot> getAllMessages() {
    List<ContactModel> contacts;
    try {
      return _chatRepository.getAllMessages(thisUid);
      
    } catch (e) {
      return null;
    }
  }

  @action
  setMessage(String value) => message = value;

  @action
  clearMessage() => message = '';

  @action
  Future<ContactModel> createNewContact(String otherUserEmail) async {
    try {
      UserModel _otherUser;
      UserModel _selfUser;
      ContactModel contact;

      _otherUser = await _chatRepository.getUserByEmail(otherUserEmail);
      _selfUser = await _userRepository.getUserFromDatabase();
      contact = await _chatRepository.createNewContact(_selfUser, _otherUser);
      return contact;
    } catch (error) {
      print(error);
    }
    return null;
  }

  @action
  Future<void> postMessage(ContactModel contact, String text) async {
    try {
      if (this.message != '') {
        var message = await createMessage(text);
        await _chatRepository.postMessage(
            contact, thisUid, contact.chatId, message);
        clearMessage();
      }
    } catch (e) {
      print(e);
    }
  }

  Future<MessageModel> createMessage(String message) async {
    var currentUser = await _userRepository.getUser();
    return MessageModel(
      content: message,
      senderId: currentUser.uid,
    );
  }

  Future<UserModel> getUserbyEmail(String userEmail) async {
    try {
      var user = await _chatRepository.getUserByEmail(userEmail);
      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
