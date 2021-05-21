import 'package:flutter/material.dart';
import 'package:pip_mvp_flutter/feature/auth/ui/auth_screen.dart';
import 'package:pip_mvp_flutter/feature/auth/ui/profile_screen.dart';
import 'package:pip_mvp_flutter/feature/contact/ui/contact_details_screen.dart';
import 'package:pip_mvp_flutter/feature/homepage/model/contact.dart';
import 'package:pip_mvp_flutter/feature/homepage/ui/home_screen.dart';

Route routes(RouteSettings setting) {
  switch (setting.name) {
    case HomeScreen.routName:
      return MaterialPageRoute<HomeScreen>(builder: (context) => const HomeScreen());
    case AuthScreen.routName:
      return MaterialPageRoute<AuthScreen>(
        builder: (context) => const AuthScreen(),
      );
    case ProfileScreen.routName:
      return MaterialPageRoute<ProfileScreen>(
        builder: (context) => const ProfileScreen(),
      );
    case ContactDetailsScreen.routName:
      final arg = setting.arguments;
      if (arg is ContactV1) {
        return MaterialPageRoute<ContactDetailsScreen>(
          builder: (context) => ContactDetailsScreen(arg),
        );
      }
      throw Exception('Invalid arguments: ${setting.arguments}');
    default:
      throw Exception('Invalid route: ${setting.name}');
  }
}
