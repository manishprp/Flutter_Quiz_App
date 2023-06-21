import 'package:flutter/material.dart';
import 'package:fquiz_app/main_questions.dart';
import 'package:fquiz_app/styles.dart';

class QuestionsSummary extends StatelessWidget {
  QuestionsSummary(
      {super.key, required this.chosenAnswers, required this.navigateToStart});
  final Function() navigateToStart;
  final List<String> chosenAnswers;
  final List<Map<String, Object>> selectedAnswerSummary = [];
  List<Map<String, Object>> getSummaryData() {
    ///List<Map<String, Object>> summary = [];
    for (int i = 0; i < questions.length; i++) {
      selectedAnswerSummary.add({
        "question_index": (i + 1),
        "question": questions[i].question,
        "correct_answer": questions[i].answers[0],
        "selected_answer": chosenAnswers[i],
      });
    }
    return selectedAnswerSummary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryList = getSummaryData();
    final totalQuestions = questions.length;

    final correctlyAnswered = summaryList.where((data) {
      return data["correct_answer"] == data["selected_answer"];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $correctlyAnswered out of $totalQuestions questions correctly.',
              style: kLargeTextStyleLight,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 300,
              child: SingleChildScrollView(
                child: Column(
                  children: summaryList.map((data) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (data["correct_answer"] ==
                                      data["selected_answer"])
                                  ? Colors.greenAccent
                                  : Colors.redAccent),
                          child: ClipOval(
                            child: Center(
                              child: Text(
                                data["question_index"].toString(),
                                style: kMediumTextStyleLight,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                data["question"].toString(),
                                style: kMediumTextStyleLightQuestions,
                                textAlign: TextAlign.start,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                data["correct_answer"].toString(),
                                style: kMediumTextStyleLightIncorrectAnswers,
                                textAlign: TextAlign.start,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                data["selected_answer"].toString(),
                                style: kSmallTextStyleLightCorrectAnswers,
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            OutlinedButton.icon(
                icon: const Icon(Icons.restart_alt),
                onPressed: navigateToStart,
                label: const Text('Restart Quiz')),
          ],
        ),
      ),
    );
  }
}
