import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const Answer({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
        child: Text(text),
      ),
    );
  }
}
