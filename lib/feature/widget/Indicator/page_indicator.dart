import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  final bool is_selected;

  const PageIndicator({super.key, required this.is_selected});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 50),
        child: CircleAvatar(
          radius: is_selected ? 10 : 5,
          backgroundColor: is_selected ? Colors.blue : Colors.grey,
        ),
      ),
    );
  }
}
