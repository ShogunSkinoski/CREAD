import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField(
      {super.key,
      required this.onChanged,
      required this.onPressed,
      required this.obscureText});

  final bool obscureText;
  final void Function(String) onChanged;
  final void Function() onPressed;
  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obscureText,
      onChanged: (value) {
        widget.onChanged(value);
      },
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(
              widget.obscureText ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            widget.onPressed();
          },
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 92, 151, 199)),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 92, 151, 199)),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        labelText: 'Password',
      ),
    );
  }
}
