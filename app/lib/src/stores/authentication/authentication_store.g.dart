// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthenticationStore on _AuthenticationStore, Store {
  final _$statusAtom = Atom(name: '_AuthenticationStore.status');

  @override
  Status get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(Status value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$usernameAtom = Atom(name: '_AuthenticationStore.username');

  @override
  String get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(String value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

  final _$emailAtom = Atom(name: '_AuthenticationStore.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: '_AuthenticationStore.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$isFormValidAtom = Atom(name: '_AuthenticationStore.isFormValid');

  @override
  bool get isFormValid {
    _$isFormValidAtom.reportRead();
    return super.isFormValid;
  }

  @override
  set isFormValid(bool value) {
    _$isFormValidAtom.reportWrite(value, super.isFormValid, () {
      super.isFormValid = value;
    });
  }

  final _$_AuthenticationStoreActionController =
      ActionController(name: '_AuthenticationStore');

  @override
  dynamic setUsername(String value) {
    final _$actionInfo = _$_AuthenticationStoreActionController.startAction(
        name: '_AuthenticationStore.setUsername');
    try {
      return super.setUsername(value);
    } finally {
      _$_AuthenticationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateUsername(String value) {
    final _$actionInfo = _$_AuthenticationStoreActionController.startAction(
        name: '_AuthenticationStore.validateUsername');
    try {
      return super.validateUsername(value);
    } finally {
      _$_AuthenticationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEmail(String value) {
    final _$actionInfo = _$_AuthenticationStoreActionController.startAction(
        name: '_AuthenticationStore.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_AuthenticationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateEmail(String value) {
    final _$actionInfo = _$_AuthenticationStoreActionController.startAction(
        name: '_AuthenticationStore.validateEmail');
    try {
      return super.validateEmail(value);
    } finally {
      _$_AuthenticationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPassword(String value) {
    final _$actionInfo = _$_AuthenticationStoreActionController.startAction(
        name: '_AuthenticationStore.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_AuthenticationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePassword(String value) {
    final _$actionInfo = _$_AuthenticationStoreActionController.startAction(
        name: '_AuthenticationStore.validatePassword');
    try {
      return super.validatePassword(value);
    } finally {
      _$_AuthenticationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void signUp() {
    final _$actionInfo = _$_AuthenticationStoreActionController.startAction(
        name: '_AuthenticationStore.signUp');
    try {
      return super.signUp();
    } finally {
      _$_AuthenticationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
status: ${status},
username: ${username},
email: ${email},
password: ${password},
isFormValid: ${isFormValid}
    ''';
  }
}
