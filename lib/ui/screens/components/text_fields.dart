// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppTextField<B extends StateStreamable<S>, S> extends StatelessWidget {
  final Function(String value, BuildContext contex) onChanged;
  final String? label;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final bool? readOnly;
  final String? text;
  const AppTextField({
    Key? key,
    required this.onChanged,
    this.label,
    this.text = "",
    this.leadingIcon,
    this.trailingIcon,
    this.readOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = TextEditingController(text: text);
    return Container(
      width: double.infinity,
      height: 48,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          border: Border.all(
              color: Colors.cyan, width: 0.5, style: BorderStyle.solid)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            (leadingIcon != null)
                ? leadingIcon!
                : const SizedBox(height: 0, width: 0),
            Expanded(
              child: TextField(
                key: const Key('loginForm_usernameInput_textField'),
                controller: _controller,
                onChanged: (username) => onChanged(username, context),
                readOnly: readOnly ?? false,
                decoration: InputDecoration(
                    enabledBorder: const UnderlineInputBorder(
                      borderSide:
                          BorderSide(width: 0.0, color: Colors.transparent),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide:
                          BorderSide(width: 0.0, color: Colors.transparent),
                    ),
                    hintText: label ?? "",
                    hintStyle: TextStyle(color: Colors.grey)),
              ),
            ),
            (trailingIcon != null)
                ? trailingIcon!
                : const SizedBox(height: 0, width: 0),
          ],
        ),
      ),
    );
  }
}

class AppPasswordField<B extends StateStreamable<S>, S>
    extends StatelessWidget {
  final Function(String value, BuildContext context) onChanged;
  final String? label;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  const AppPasswordField({
    required this.onChanged,
    this.label,
    this.leadingIcon,
    this.trailingIcon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          border: Border.all(
              color: Colors.cyan, width: 0.5, style: BorderStyle.solid)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            (leadingIcon != null)
                ? leadingIcon!
                : const SizedBox(height: 0, width: 0),
            Expanded(
              child: TextField(
                key: const Key('loginForm_usernameInput_textField'),
                onChanged: (username) => onChanged(username, context),
                obscureText: true,
                maxLines: 1,
                decoration: InputDecoration(
                    enabledBorder: const UnderlineInputBorder(
                      borderSide:
                          BorderSide(width: 0.0, color: Colors.transparent),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide:
                          BorderSide(width: 0.0, color: Colors.transparent),
                    ),
                    hintText: label ?? "",
                    hintStyle: TextStyle(color: Colors.grey)),
              ),
            ),
            (trailingIcon != null)
                ? trailingIcon!
                : const SizedBox(height: 0, width: 0),
          ],
        ),
      ),
    );
  }
}
