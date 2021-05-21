import 'package:pip_mvp_flutter/feature/auth/models/user.dart';
import 'package:pip_mvp_flutter/feature/auth/repository/user_repository_interface.dart';
import 'package:pip_mvp_flutter/utils/shared_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository extends IUserRepository {
  SharedPreferences? prefs;

  UserRepository({required this.prefs});

  @override
  Future<bool> login(String login, String password) async {
    await prefs!.setBool(SharedKey.spKeyIsLoggedIn, true);
    await prefs!.setString(SharedKey.spKeyName, login);

    return isLoggedIn();
  }

  @override
  Future<bool> isLoggedIn() async {
    return prefs == null
        ? false
        : prefs!.containsKey(SharedKey.spKeyIsLoggedIn);
  }

  @override
  Future<UserV1> getUser() async {
    final name = prefs!.getString(SharedKey.spKeyName) ?? '';

    return UserV1(email: name);
  }

  @override
  Future<void> logout() async {
    await prefs!.clear();
  }
}
