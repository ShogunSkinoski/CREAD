import 'package:flutter/material.dart';

class ErrorSnackBarWidget extends StatelessWidget {
  final String errorMessage;
  const ErrorSnackBarWidget({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return SnackBar(content: Text(errorMessage));
  }
}
