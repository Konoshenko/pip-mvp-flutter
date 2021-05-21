import 'package:flutter/material.dart';
import 'package:pip_mvp_flutter/feature/auth/ui/auth_screen.dart';
import 'package:pip_mvp_flutter/feature/auth/ui/profile_screen.dart';
import 'package:pip_mvp_flutter/feature/homepage/model/contact.dart';
import 'package:pip_mvp_flutter/feature/homepage/ui/home_screen.dart';

import 'feature/contact/ui/contact_details_screen.dart';

Route routes(RouteSettings setting) {
  switch (setting.name) {
    case MyHomePage.routName:
      return MaterialPageRoute<MyHomePage>(builder: (context) => MyHomePage());
    case AuthScreen.routName:
      return MaterialPageRoute<AuthScreen>(
          builder: (context) => const AuthScreen());
    case ProfileScreen.routName:
      return MaterialPageRoute<ProfileScreen>(
          builder: (context) => ProfileScreen());
    case ContactDetailsScreen.routName:
      final arg = setting.arguments;
      if (arg is ContactV1) {
        return MaterialPageRoute<ContactDetailsScreen>(
            builder: (context) => ContactDetailsScreen(arg));
      }
      throw Exception('Invalid arguments: ${setting.arguments}');
    default:
      throw Exception('Invalid route: ${setting.name}');
  }
}
