import 'package:app/main.dart';
import 'package:app/question.dart';
import 'package:flutter/material.dart';

import 'answer.dart';

class Quiz extends StatelessWidget {
  final QuestionType question;
  final Function onAnswer;
  const Quiz({required this.question, required this.onAnswer, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(question.question),
        ...question.answers
            .asMap()
            .entries
            .map(
              (answer) => Answer(
                onPressed: () => onAnswer(answer.key),
                text: answer.value,
              ),
            )
            .toList()
      ],
    );
  }
}
