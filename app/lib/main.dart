import 'package:app/quiz.dart';
import 'package:app/result.dart';
import 'package:flutter/material.dart';

class QuestionType {
  final String question;
  final List<String> answers;
  final int answerIndex;
  QuestionType({
    required this.question,
    required this.answers,
    required this.answerIndex,
  });
}

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _score = 0;
  @override
  Widget build(BuildContext context) {
    final questions = [
      QuestionType(
        question: "Whats your favorite color?",
        answers: [
          'Red',
          'Blue',
          'Green',
          'Yellow',
        ],
        answerIndex: 1,
      ),
      QuestionType(
        question: "Whats your favorite animal?",
        answers: [
          'a',
          'b',
          'c',
          'd',
        ],
        answerIndex: 2,
      ),
    ];

    void answerQuestion(int answeredIndex) {
      debugPrint('$answeredIndex');
      setState(() {
        if (answeredIndex == questions[_questionIndex].answerIndex) _score++;
        _questionIndex++;
      });
    }

    void resetQuiz() {
      setState(() {
        _score = 0;
        _questionIndex = 0;
      });
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('hey mom!'),
        ),
        body: _questionIndex < questions.length
            ? Quiz(
                question: questions[_questionIndex], onAnswer: answerQuestion)
            : Result(
                score: _score,
                onReset: () => resetQuiz(),
              ),
      ),
    );
  }
}
