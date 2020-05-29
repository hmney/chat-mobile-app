import 'package:mobx/mobx.dart';

part 'authentication_error_store.g.dart';

class AuthenticationErrorStore = _SignupErrorStore with _$AuthenticationErrorStore;

abstract class _SignupErrorStore with Store {
  @observable
  String username;

  @observable
  String email;

  @observable
  String password;

  @observable
  String signupError;

  @computed
  bool get hasErrors => username != null || email != null || password != null;
}