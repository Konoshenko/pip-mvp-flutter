// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pip_mvp_flutter/feature/auth/ui/auth_page.dart';

class AuthScreen extends StatefulWidget {
  static const String routName = '/auth_screen';

  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) =>
      Scaffold(body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth < 800) {
          return AuthPage();
        } else {
          return Center(
            child: Container(
              width: 400,
              child: AuthPage(),
            ),
          );
        }
      }));
}
