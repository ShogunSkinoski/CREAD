// ignore_for_file: pref

import 'package:flutter/material.dart';

class EmailTextField extends StatefulWidget {
  EmailTextField({
    super.key,
    required this.onChanged,
    required this.emailError,
  });
  final void Function(String) onChanged;
  final String? Function() emailError;

  @override
  State<EmailTextField> createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        widget.onChanged(value);
      },
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 92, 151, 199)),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        errorText: widget.emailError(),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 92, 151, 199)),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        labelText: "E-mail",
      ),
    );
  }
}
