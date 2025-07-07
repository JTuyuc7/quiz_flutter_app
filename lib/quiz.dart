import 'package:flutter/material.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/data/questions.dart'; // Assuming you have a questions.dart file with your questions

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  // Widget? activeScreen;
  var activeScreen = 'start-screen';
  final List<String> selectedAnswers = [];

  // @override
  // initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  //   // You can initialize any data or state here if needed
  // }

  void selectAnswer(String answer) {
    selectedAnswers.add(answer);
    // print('Selected answers: $selectedAnswers');
    if (selectedAnswers.length == questions.length) {
      // Handle the end of the quiz, e.g., show results or reset
      // print('Quiz completed with answers: $selectedAnswers');
      // Reset for next quiz
      // selectedAnswers.clear();
      setState(() {
        // activeScreen = 'start-screen'; // Reset to start screen after quiz completion
        // Navigate to the results screen or show a dialog
        activeScreen = 'results-screen';
      });
    }
  }

  void switchScreen() {
    setState(() {
      // activeScreen = const QuestionsScreen();
      activeScreen = 'questions-screen';
    });
  }

  void onResetQuiz() {
    setState(() {
      activeScreen = 'start-screen';
      selectedAnswers.clear(); // Clear the answers for a new quiz
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget widgetScreen;
    // final widgetScreen = activeScreen == 'start-screen'
    //     ? StartScreen(switchScreen)
    //     : QuestionsScreen(onSelectedAnswer: selectAnswer);
    if (activeScreen == 'start-screen') {
      widgetScreen = StartScreen(switchScreen);
    } else if (activeScreen == 'questions-screen') {
      widgetScreen = QuestionsScreen(onSelectedAnswer: selectAnswer);
    } else if (activeScreen == 'results-screen') {
      // Handle other screens like results or end screen
      widgetScreen = ResultsScreen(answersResults: selectedAnswers, onResetQuiz: onResetQuiz);
    } else {
      // Default fallback
      widgetScreen = StartScreen(switchScreen);
    }

    return Scaffold(
      backgroundColor:
          Colors.deepPurple, // Helps with iOS status bar background
      extendBodyBehindAppBar: false,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 39, 1, 55),
              Color.fromARGB(255, 71, 16, 110),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // children: [activeScreen ?? const SizedBox()],
            children: [
              // if (activeScreen == 'start-screen')
              //   StartScreen(switchScreen)
              // else if (activeScreen == 'questions-screen')
              //   const QuestionsScreen(),
              // activeScreen ?? const SizedBox(),
              // activeScreen == 'start-screen'
              //     ? StartScreen(switchScreen)
              //     : QuestionsScreen(),
              widgetScreen,
            ],
          ),
        ),
      ),
    );
  }
}
