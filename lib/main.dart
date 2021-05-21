import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pip_mvp_flutter/feature/auth/cubit/auth_cubit.dart';
import 'package:pip_mvp_flutter/feature/auth/repository/user_repository.dart';
import 'package:pip_mvp_flutter/feature/auth/ui/auth_screen.dart';
import 'package:pip_mvp_flutter/feature/homepage/ui/home_screen.dart';
import 'package:pip_mvp_flutter/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final pref = await SharedPreferences.getInstance();
  runApp(PipApp(pref: pref));
}

class PipApp extends StatelessWidget {
  final SharedPreferences pref;

  const PipApp({required this.pref, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(
            UserRepository(prefs: pref),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: routes,
        home: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) =>
              (state is AuthIsLoggedIn) ? const HomeScreen() : const AuthScreen(),
        ),
      ),
    );
  }
}
