import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/q_summary.dart'; // Assuming you have a questions.dart file with your questions

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.answersResults,
    required this.onResetQuiz,
  });

  final List<String> answersResults;
  final void Function() onResetQuiz;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summaryData = [];

    for (var i = 0; i < answersResults.length; i++) {
      summaryData.add({
        'question_index': i,
        'question': questions[i].questionText,
        'user_answer': answersResults[i],
        'correct_answer':
            questions[i].answers[0], // Assuming the first answer is correct
      });
    }

    return summaryData;
  }

  // var summary = getSummaryData();

  // print(summary);

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final totalQuestions = questions.length;
    final correctAnswers = summaryData
        .where((answer) => answer['user_answer'] == answer['correct_answer']).length; // Assuming the first answer is correct

    return (Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(20),
      // decoration: const BoxDecoration(
      //   gradient: LinearGradient(
      //     colors: [Colors.deepPurple, Colors.purpleAccent],
      //     begin: Alignment.topLeft,
      //     end: Alignment.bottomRight,
      //   ),
      // ),
      child: Column(
        children: [
          Text(
            'You got $correctAnswers out of $totalQuestions questions right!',
            style: const TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          QSummary(summaryData: summaryData),
          // const Text(
          //   "List of answers will go here",
          //   style: TextStyle(fontSize: 18, color: Colors.white70),
          //   textAlign: TextAlign.center,
          // ),
          SizedBox(height: 20),
          ElevatedButton.icon(
            icon: const Icon(Icons.refresh, color: Color.fromARGB(255, 4, 4, 4)),
            onPressed: () {
              //print("Restart Quiz");
              onResetQuiz();
            },
            label: const Text(
              "Restart quiz",
              style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 12, 12, 12)),
            ),
          ),
        ],
      ),
    ));
  }
}
