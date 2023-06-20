// tbis is the questions data model where there are this thisgs
class QuizQuestion {
  const QuizQuestion(this.question, this.answers);
  final String question;
  final List<String> answers;

  List<String> getShuffeledAnswers() {
    final list = List.of(answers);
    list.shuffle();
    return list;
  }
}
