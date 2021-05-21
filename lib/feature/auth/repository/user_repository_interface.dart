import 'package:pip_mvp_flutter/feature/auth/models/user.dart';

abstract class IUserRepository {
  Future<void> logout();

  Future<UserV1> getUser();

  Future<bool> isLoggedIn();

  Future<bool> login(String login, String password);
}
