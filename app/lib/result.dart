import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final VoidCallback onReset;
  const Result({required this.score, required this.onReset, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            "You did it!! $score",
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          ElevatedButton(
              onPressed: onReset, child: const Text('Lets go again!'))
        ],
      ),
    );
  }
}
