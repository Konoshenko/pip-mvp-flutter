
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pip_mvp_flutter/components/button_pip.dart';
import 'package:pip_mvp_flutter/feature/auth/cubit/auth_cubit.dart';
import 'package:pip_mvp_flutter/utils/validator.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _focusPassword = FocusNode();
  final _formKey = GlobalKey<FormState>();
  bool _btnDisable = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: context.read<AuthCubit>(),
        builder: (context, AuthState state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Expanded(
                    child: SvgPicture.asset(
                      'assets/icon/activity_outline.svg',
                      color: Theme.of(context).accentColor,
                      height: double.infinity,
                    ),
                  ),
                  SizedBox(
                    height: 80,
                    child: TextFormField(
                      autofocus: true,
                      onFieldSubmitted: (_) => _focusPassword.requestFocus(),
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w400),
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        return Validator.validateEmail(value);
                      },
                      onChanged: (value) {
                        setState(() {
                          _btnDisable = _isFormEmpty();
                        });
                      },
                      decoration: InputDecoration(
                          labelText: 'Email',
                          errorText: (state is AuthError) ? state.error : null),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                    child: TextFormField(
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).unfocus();
                        _onClickSignIn();
                      },
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w400),
                      obscureText: true,
                      focusNode: _focusPassword,
                      obscuringCharacter: '*',
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => Validator.validatePassword(value),
                      onChanged: (value) {
                        setState(() {
                          _btnDisable = _isFormEmpty();
                        });
                      },
                      controller: _passwordController,
                      decoration: const InputDecoration(labelText: 'Password'),
                    ),
                  ),
                  Spacer(),
                  ButtonPip(
                    margin:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 32),
                    title: 'Sign in',
                    enable: _btnDisable
                        ? ButtonPipState.disable
                        : state is AuthLoading
                        ? ButtonPipState.loading
                        : ButtonPipState.enable,
                    onClick: _onClickSignIn,
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _onClickSignIn() async {
    if (_formKey.currentState!.validate()) {
      context
          .read<AuthCubit>()
          .login(_emailController.text, _passwordController.text);
    }
  }

  bool _isFormEmpty() =>
      _passwordController.text.isEmpty || _emailController.text.isEmpty;
}
