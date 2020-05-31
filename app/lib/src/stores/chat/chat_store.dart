import 'package:app/src/models/message_model.dart';
import 'package:app/src/models/user_model.dart';
import 'package:app/src/repositories/chat_repository.dart';
import 'package:app/src/repositories/user_repository.dart';
import 'package:mobx/mobx.dart';

part 'chat_store.g.dart';

class ChatStore = _ChatStore with _$ChatStore;

abstract class _ChatStore with Store {
  final ChatRepository _chatRepository = ChatRepository();
  final UserRepository _userRepository = UserRepository();

  @observable
  String message = '';

  @action
  setMessage(String value) => message = value;

  @action
  clearMessage() => message = '';

  @action
  Future<String> createNewContact(String otherUserEmail) async {
    try {
      UserModel _otherUser;
      UserModel _selfUser;
      String chatId;

      await _chatRepository.getUserByEmail(otherUserEmail).then((value) async {
        if (value.documents.length != 0) {
          var result = value.documents[0].data;
          _otherUser = UserModel(
            uid: result['uid'],
            username: result['username'],
            email: result['email'],
          );
          _selfUser = await _userRepository.getUserFromDatabase();
          chatId =
              await _chatRepository.createNewContact(_selfUser, _otherUser);
        }
      });
      return chatId;
    } catch (error) {
      print(error);
    }
    return null;
  }

  @action
  // Future<Stream<QuerySnapshot>> getChatMessages(String chatId) async {
  //   try {
  //     var messages = _chatRepository.getChatMessages(chatId);

  //     return messages;
  //   } catch (error) {
  //     print(error);
  //   }
  //   return null;
  // }

  @action
  Future<void> postMessage(String chatId, String text) async {
    try {
      if (this.message != '') {
        var message = await createMessage(text);
        await _chatRepository.postMessage(chatId, message);
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
      time: DateTime.now(),
    );
  }
}
