import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'quiz.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent, // or your preferred color
          statusBarBrightness: Brightness.dark, // iOS: dark == white text
          statusBarIconBrightness:
              Brightness.light, // Android: light == white icons
        ),
        child: Quiz(),
      ),
    );
  }
}
