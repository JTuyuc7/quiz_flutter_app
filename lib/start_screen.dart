import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.onChangeScreen, {super.key});

  final void Function() onChangeScreen;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Opacity(opacity: 0.8,
          child: Image.asset('assets/images/quiz-logo.png')
        ),
        const SizedBox(height: 20),
        const Text(
          'Learn Flutter the fun way!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 20),
        OutlinedButton.icon(
          onPressed: onChangeScreen,
          // onPressed: () {
          //   // Navigate to the quiz screen
          //   onChangeScreen();
          // },
          label: const Text('Start Quiz', style: TextStyle(color: Colors.white)),
          icon: const Icon(Icons.arrow_forward, color: Colors.white),
        ),
      ],
    );
  }
}
