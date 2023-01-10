import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextInput<B extends StateStreamable<S>, S> extends StatelessWidget {
  final Function(String value, BuildContext context) onChanged;
  final TextInputType? inputType;
  final Widget child;

  const TextInput(
      {super.key,
      this.inputType,
      required this.onChanged,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<B, S>(
      builder: (context, state) {
        return child;
      },
    );
  }
}
