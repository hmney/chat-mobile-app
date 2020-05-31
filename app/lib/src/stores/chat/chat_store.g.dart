// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChatStore on _ChatStore, Store {
  final _$messageAtom = Atom(name: '_ChatStore.message');

  @override
  String get message {
    _$messageAtom.reportRead();
    return super.message;
  }

  @override
  set message(String value) {
    _$messageAtom.reportWrite(value, super.message, () {
      super.message = value;
    });
  }

  final _$createNewContactAsyncAction =
      AsyncAction('_ChatStore.createNewContact');

  @override
  Future<String> createNewContact(String otherUserEmail) {
    return _$createNewContactAsyncAction
        .run(() => super.createNewContact(otherUserEmail));
  }

  final _$postMessageAsyncAction = AsyncAction('_ChatStore.postMessage');

  @override
  Future<void> postMessage(String chatId, String text) {
    return _$postMessageAsyncAction.run(() => super.postMessage(chatId, text));
  }

  final _$_ChatStoreActionController = ActionController(name: '_ChatStore');

  @override
  dynamic setMessage(String value) {
    final _$actionInfo =
        _$_ChatStoreActionController.startAction(name: '_ChatStore.setMessage');
    try {
      return super.setMessage(value);
    } finally {
      _$_ChatStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearMessage() {
    final _$actionInfo = _$_ChatStoreActionController.startAction(
        name: '_ChatStore.clearMessage');
    try {
      return super.clearMessage();
    } finally {
      _$_ChatStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
message: ${message}
    ''';
  }
}
