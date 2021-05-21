part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthIsLoggedIn extends AuthState {
  final UserV1 userV1;

  @override
  List<Object> get props => [userV1];

  const AuthIsLoggedIn(this.userV1);
}

class AuthIsLoggedOut extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthLoading extends AuthState {
  @override
  List<Object> get props => [];
}


class AuthError extends AuthState {
  final String error;

  const AuthError(this.error);

  @override
  List<Object> get props => [error];
}
