// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChatStore on _ChatStore, Store {
  Computed<bool> _$checkSenderUidComputed;

  @override
  bool get checkSenderUid =>
      (_$checkSenderUidComputed ??= Computed<bool>(() => super.checkSenderUid,
              name: '_ChatStore.checkSenderUid'))
          .value;

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

  final _$thisUidAtom = Atom(name: '_ChatStore.thisUid');

  @override
  String get thisUid {
    _$thisUidAtom.reportRead();
    return super.thisUid;
  }

  @override
  set thisUid(String value) {
    _$thisUidAtom.reportWrite(value, super.thisUid, () {
      super.thisUid = value;
    });
  }

  final _$thisUsernameAtom = Atom(name: '_ChatStore.thisUsername');

  @override
  String get thisUsername {
    _$thisUsernameAtom.reportRead();
    return super.thisUsername;
  }

  @override
  set thisUsername(String value) {
    _$thisUsernameAtom.reportWrite(value, super.thisUsername, () {
      super.thisUsername = value;
    });
  }

  final _$senderUidAtom = Atom(name: '_ChatStore.senderUid');

  @override
  String get senderUid {
    _$senderUidAtom.reportRead();
    return super.senderUid;
  }

  @override
  set senderUid(String value) {
    _$senderUidAtom.reportWrite(value, super.senderUid, () {
      super.senderUid = value;
    });
  }

  final _$getThisUidAsyncAction = AsyncAction('_ChatStore.getThisUid');

  @override
  Future<void> getThisUid() {
    return _$getThisUidAsyncAction.run(() => super.getThisUid());
  }

  final _$createNewContactAsyncAction =
      AsyncAction('_ChatStore.createNewContact');

  @override
  Future<ContactModel> createNewContact(String otherUserEmail) {
    return _$createNewContactAsyncAction
        .run(() => super.createNewContact(otherUserEmail));
  }

  final _$postMessageAsyncAction = AsyncAction('_ChatStore.postMessage');

  @override
  Future<void> postMessage(ContactModel contact, String text) {
    return _$postMessageAsyncAction.run(() => super.postMessage(contact, text));
  }

  final _$_ChatStoreActionController = ActionController(name: '_ChatStore');

  @override
  dynamic setThisUsername(String value) {
    final _$actionInfo = _$_ChatStoreActionController.startAction(
        name: '_ChatStore.setThisUsername');
    try {
      return super.setThisUsername(value);
    } finally {
      _$_ChatStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setThisUid(String value) {
    final _$actionInfo =
        _$_ChatStoreActionController.startAction(name: '_ChatStore.setThisUid');
    try {
      return super.setThisUid(value);
    } finally {
      _$_ChatStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSenderUid(String value) {
    final _$actionInfo = _$_ChatStoreActionController.startAction(
        name: '_ChatStore.setSenderUid');
    try {
      return super.setSenderUid(value);
    } finally {
      _$_ChatStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  Stream<QuerySnapshot> getChatMessages(String chatId) {
    final _$actionInfo = _$_ChatStoreActionController.startAction(
        name: '_ChatStore.getChatMessages');
    try {
      return super.getChatMessages(chatId);
    } finally {
      _$_ChatStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  Stream<QuerySnapshot> getAllMessages() {
    final _$actionInfo = _$_ChatStoreActionController.startAction(
        name: '_ChatStore.getAllMessages');
    try {
      return super.getAllMessages();
    } finally {
      _$_ChatStoreActionController.endAction(_$actionInfo);
    }
  }

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
message: ${message},
thisUid: ${thisUid},
thisUsername: ${thisUsername},
senderUid: ${senderUid},
checkSenderUid: ${checkSenderUid}
    ''';
  }
}
