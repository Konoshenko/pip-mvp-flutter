import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pip_mvp_flutter/feature/auth/cubit/auth_cubit.dart';
import 'package:pip_mvp_flutter/feature/auth/models/user.dart';
import 'package:pip_mvp_flutter/feature/auth/repository/user_repository.dart';

import 'test_auth_cubit.mocks.dart';

@GenerateMocks([UserRepository])
void main() {
  final authRepo = MockUserRepository();

  group('AuthCubit', () {
    final UserV1 user = UserV1(id: 'test', email: 'test');

    blocTest<AuthCubit, AuthState>(
      'Authorization without error',
      build: () {
        when(authRepo.isLoggedIn()).thenAnswer((_) => Future.value(true));
        when(authRepo.login(any, any)).thenAnswer((_) => Future.value(true));
        when(authRepo.getUser()).thenAnswer((_) => Future.value(user));

        return AuthCubit(authRepo);
      },
      act: (cubit) => cubit.login('test', 'test'),
      expect: () => [AuthLoading(), AuthIsLoggedIn(user)],
    );

    blocTest<AuthCubit, AuthState>(
      'Fail login',
      build: () {
        when(authRepo.isLoggedIn()).thenAnswer((_) => Future.value(false));
        when(authRepo.login(any, any)).thenAnswer((_) => Future.value(false));
        when(authRepo.getUser()).thenAnswer((_) => Future.value(user));

        return AuthCubit(authRepo);
      },
      act: (cubit) => cubit.login('test', 'test'),
      expect: () => [AuthLoading(), AuthIsLoggedOut()],
    );

    blocTest<AuthCubit, AuthState>(
      'Unknown error during login',
      build: () {
        when(authRepo.isLoggedIn()).thenAnswer((_) => Future.value(false));
        when(authRepo.login(any, any)).thenThrow(Exception());
        when(authRepo.getUser()).thenThrow(Exception());

        return AuthCubit(authRepo);
      },
      act: (cubit) => cubit.login('test', 'test'),
      expect: () =>
          [AuthLoading(), AuthIsLoggedOut(), AuthError(Exception().toString())],
    );

    blocTest<AuthCubit, AuthState>(
      'Http exception during login',
      build: () {
        when(authRepo.isLoggedIn()).thenAnswer((_) => Future.value(false));
        when(authRepo.login(any, any)).thenThrow(const HttpException('test'));
        when(authRepo.getUser()).thenThrow(const HttpException('test'));

        return AuthCubit(authRepo);
      },
      act: (cubit) => cubit.login('test', 'test'),
      expect: () => [
        AuthLoading(),
        AuthIsLoggedOut(),
        AuthError(const HttpException('test').toString()),
      ],
    );

    blocTest<AuthCubit, AuthState>(
      'Log out without error',
      build: () {
        when(authRepo.isLoggedIn()).thenAnswer((_) => Future.value(false));

        return AuthCubit(authRepo);
      },
      seed: () => AuthIsLoggedIn(user),
      act: (cubit) => cubit.logout(),
      expect: () => [AuthIsLoggedOut()],
    );
  });
}
