import 'package:app/routes/app_routes.dart';
import 'package:app/src/models/user_model.dart';
import 'package:app/src/repositories/user_repository.dart';
import 'package:app/src/stores/authentication/authentication_error_store.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'authentication_store.g.dart';

class AuthenticationStore = _AuthenticationStore with _$AuthenticationStore;

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

abstract class _AuthenticationStore with Store {
  final UserRepository userRepository = UserRepository();
  final AuthenticationErrorStore error = AuthenticationErrorStore();

  @observable
  Status status = Status.Uninitialized;

  @observable
  String username = '';

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  bool isLoggedIn;

  @action
  setUsername(String value) => username = value;

  @action
  void validateUsername(String value) {
    if (value == null || value.isEmpty) {
      error.username = 'username canno\'t be blank';
    }
    if (value.length < 6 || value.length > 8) {
      error.username = 'username length must be between 6 and 8';
    } else {
      error.username = null;
    }
  }

  @action
  setEmail(String value) => email = value;

  @action
  void validateEmail(String value) {
    if (value == null || value.isEmpty) {
      error.email = 'Email canno\'t be blank';
    } else {
      error.email = null;
    }
  }

  @action
  setPassword(String value) => password = value;

  @action
  void validatePassword(String value) {
    if (value == null || value.isEmpty) {
      error.password = 'password canno\'t be blank';
    } else {
      error.password = null;
    }
  }

  @action
  Future<void> signUp() async {
    validateUsername(username);
    validateEmail(email);
    validatePassword(password);
    var userInfo = UserModel(
      username: username,
      email: email,
      password: password,
      profilePicture: null,
    );

    if (!error.hasErrors) {
      try {
        await userRepository.signUp(email: email, password: password);
        var user = await userRepository.getUser();
        status = Status.Authenticated;
        userRepository.addUserToDatabase(userInfo, user);
        Modular.to.pushNamedAndRemoveUntil(
          pathForRoute(APP_ROUTE.HOME),
          (_) => false,
        );
      } on PlatformException catch (error) {
        status = Status.Unauthenticated;
        List<String> errors = error.toString().split(',');
        this.error.authErrorMsg = errors[1];
        print("Error: " + errors[1]);
      }
    }
    print(this.error.authErrorMsg);
  }

  @action
  Future<void> signIn() async {
    validateEmail(email);
    validatePassword(password);
    if (!error.hasErrors) {
      try {
        await userRepository.signIn(email: email, password: password);
        status = Status.Authenticated;
        Modular.to.pushNamedAndRemoveUntil(
          pathForRoute(APP_ROUTE.HOME),
          (_) => false,
        );
      } on PlatformException catch (error) {
        status = Status.Unauthenticated;
        List<String> errors = error.toString().split(',');
        this.error.authErrorMsg = errors[1];
        print("Error: " + errors[1]);
      }
    }
  }

  void freeStore() {
    username = '';
    email = '';
    password = '';
  }

  @action
  Future<void> signOut() async {
    try {
      await userRepository.signOut();
      status = Status.Unauthenticated;
      freeStore();
      Modular.to.pushNamedAndRemoveUntil(
        pathForRoute(APP_ROUTE.AUTHENTICATION),
        (_) => false,
      );
    } catch (error) {
      print(error);
    }
  }

  @action
  Future<void> checkIsLoggedIn() async {
    try {
      isLoggedIn = await userRepository.isSignedIn();
    } catch (error) {
      print(error);
    }
  }
}
