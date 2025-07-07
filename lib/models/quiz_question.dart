class QuizQuestion {
  String questionText;
  List<String> answers;
  // final int correctAnswerIndex;

  QuizQuestion({
    required this.questionText,
    required this.answers,
    // required this.correctAnswerIndex,
  });

  // bool isCorrect(int selectedAnswerIndex) {
  //   return selectedAnswerIndex == correctAnswerIndex;
  // }
  List<String> getShuffledAnswers() {
    // final shuffled = List<String>.from(answers);
    // shuffled.shuffle();
    // return shuffled;

    // return List<String>.from(answers)..shuffle();
    final shufledList = List.of(answers);

    shufledList.shuffle();

    return shufledList;
  }
}
