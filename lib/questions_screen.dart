import 'package:flutter/material.dart';
import 'answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectedAnswer});

  final void Function(String answer) onSelectedAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void onSelectAnswer(String answer) {
    widget.onSelectedAnswer(answer); // Call the callback with the selected answer
    // print('Selected answer: $answer');
    // Here you can handle the answer selection logic, like checking if it's correct
    // and updating the current question index.
    setState(() {
      currentQuestionIndex++;
      if (currentQuestionIndex >= questions.length) {
        // Reset to the first question or handle quiz completion
        currentQuestionIndex = 0;
        
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion =
        questions[currentQuestionIndex]; // For simplicity, using the first question

    return Center(
      child: Container(
        margin: EdgeInsets.only(left: 15, right: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                currentQuestion.questionText,
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  fontSize: 26,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return Padding(
                padding: EdgeInsetsGeometry.all(10),
                child: AnswerButton(
                  answerText: answer,
                  onTap: () {
                    print('Answer selected: $answer');
                    onSelectAnswer(answer);
                  },
                ),
              );
            }),
            // AnswerButton(
            //   answerText: currentQuestion.answers[0],
            //   onTap: () {
            //     print('Answer 1 selected');
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
