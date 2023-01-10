import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/text_fields.dart';
import 'bloc/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: Scaffold(
        body: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state.isLoginSuccess != null && state.isLoginSuccess!) {
              context.router.pushNamed("/home");
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppTextField<LoginBloc, LoginState>(
                    label: "Email",
                    onChanged: (username, ctx) => {
                          ctx
                              .read<LoginBloc>()
                              .add(LoginUsernameUpdate(username))
                        }),
                const SizedBox(
                  height: 10,
                ),
                AppPasswordField<LoginBloc, LoginState>(
                    label: "Password",
                    onChanged: (password, ctx) => {
                          ctx
                              .read<LoginBloc>()
                              .add(LoginPasswordUpdate(password))
                        }),
                const SizedBox(
                  height: 10,
                ),
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(50), // NEW
                        ),
                        onPressed: () => {
                              context
                                  .read<LoginBloc>()
                                  .add(LoginSubmitButtonPressed())
                            },
                        child: const Text("Login"));
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                      onTap: () => {context.router.pushNamed('/registration')},
                      child: const Text("Dont Have an account? SignUp Here")),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
