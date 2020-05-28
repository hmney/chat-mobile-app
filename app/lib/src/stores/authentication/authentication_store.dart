import 'package:app/src/repositories/user_repository.dart';
import 'package:app/src/stores/authentication/authentication_error_store.dart';
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
  bool isFormValid = false;

  @action
  setUsername(String value) => username = value;

  @action
  void validateUsername(String value) {
    if (value == null || value.isEmpty) {
      error.username = 'username canno\'t be blank';
    } if (value.length < 6 || value.length > 8) {
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
  void signUp() {
    validateUsername(this.username);
    validateEmail(this.email);
    validatePassword(this.password);
    this.isFormValid = !error.hasErrors;
    if (isFormValid) {
      userRepository.signUp(email: email, password: password);
    }
  }
}