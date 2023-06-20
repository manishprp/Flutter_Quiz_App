import 'package:flutter/material.dart';
import 'package:fquiz_app/styles.dart';
import 'package:fquiz_app/main_questions.dart';
import 'answer_buttons.dart';

class Question extends StatefulWidget {
  const Question({super.key});
  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  var currentIndex = 0;
  void answerQuestions() {
    setState(() {
      if (currentIndex == 5) currentIndex = 1;
      currentIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.question,
              style: kMediumTextStyleLight,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
            ),
            /*
            here the currentQuestions is a current qquestion object, the currentQuestion.answers is the list of answers where we pass the answers in the anonymous function
             " () {}" is the anonymous function, where we pass the value in the "(this )" ans use it in "{ return here} " 
             so the answers which is passed is the string content of the answer in currentQuestion.answers
             now it is doing is mapping each answer to the QuestionButtons object which is indirectly a widget and then we are getting a list of widgets.
             but then we have a widget list and we cannot pass it in column as it needs just widget and not list, therefore we use the spread operator "..."
             this makes the coimma separated values out of the list which is then individual widgets and this was we get the dynamiucally generated QuestionButtons (answer buttons more effectively)*/
            ...currentQuestion.getShuffeledAnswers().map((answers) {
              return QuestionButtons(answer: answers, onTap: answerQuestions);
            })
          ],
        ),
      ),
    );
  }
}
