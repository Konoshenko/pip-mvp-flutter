import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pip_mvp_flutter/feature/auth/models/user.dart';
import 'package:pip_mvp_flutter/feature/auth/repository/user_repository_interface.dart';
import 'package:pip_mvp_flutter/utils/exceptions.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> implements IAuth {
  AuthCubit(this.userRepository) : super(AuthIsLoggedOut()) {
    launch();
  }

  IUserRepository userRepository;

  @override
  Future<void> launch() async {
    final isLoggedIn = await userRepository.isLoggedIn();
    if (isLoggedIn) {
      final user = await userRepository.getUser();
      emit(AuthIsLoggedIn(user));
    } else {
      emit(AuthIsLoggedOut());
    }
  }

  @override
  Future<void> login(String email, String password) async {
    try {
      emit(AuthLoading());
      await Future.delayed(Duration(milliseconds: 1000));
      final isLoggedIn = await userRepository.login(email, password);
      if (isLoggedIn) {
        final user = await userRepository.getUser();
        emit(AuthIsLoggedIn(user));
      } else {
        emit(AuthIsLoggedOut());
      }
    } on AppHttpException catch (err) {
      emit(AuthError(err.message));
    } catch (err) {
      emit(AuthError(err.toString()));
    }
  }

  @override
  logout() async {
    await userRepository.logout();
    emit(AuthIsLoggedOut());
  }
}

abstract class IAuth {
  login(String email, String password);

  logout();

  launch();
}
