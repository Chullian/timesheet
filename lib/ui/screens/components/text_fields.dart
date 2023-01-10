import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppTextField<B extends StateStreamable<S>, S> extends StatelessWidget {
  final Function(String value, BuildContext contex) onChanged;
  final String? label;
  const AppTextField({
    required this.onChanged,
    this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<B, S>(
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_usernameInput_textField'),
          onChanged: (username) => onChanged(username, context),
          decoration: InputDecoration(
            labelText: label ?? "",
          ),
        );
      },
    );
  }
}

class AppPasswordField<B extends StateStreamable<S>, S>
    extends StatelessWidget {
  final Function(String value, BuildContext context) onChanged;
  final String? label;
  const AppPasswordField({
    required this.onChanged,
    this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<B, S>(
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_usernameInput_textField'),
          onChanged: (username) => onChanged(username, context),
          obscureText: true,
          decoration: InputDecoration(labelText: label ?? ""),
        );
      },
    );
  }
}
