import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pip_mvp_flutter/feature/auth/cubit/auth_cubit.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  static const String routName = '/profile_screen';

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final user = (context.read<AuthCubit>().state as AuthIsLoggedIn).userV1;

    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Theme.of(context).canvasColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    const SizedBox(height: 26),
                    const CircleAvatar(
                      minRadius: 40,
                      child: Icon(Icons.people_outline_outlined),
                    ),
                    const SizedBox(height: 26),
                    Text(user.email),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              TextButton(
                onPressed: () {
                  context.read<AuthCubit>().logout();
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: const Text('Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
