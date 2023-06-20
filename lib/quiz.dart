import 'package:flutter/material.dart';
import 'package:fquiz_app/questions.dart';
import 'package:fquiz_app/start_screen.dart';

// this is the class, where there will changes occurs in the child part of the container there will be changes will will occur on navgation
// this is like replacing the previous screen with new one.
// the startpage will be replaced with question screen.
// here we are having a variable activescreen whoch will be the one storiung currentlty presenting screen
class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Widget currentScreen = const StartPage();
  void switchScreen() {
    currentScreen = const Question();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 94, 3, 94),
                Color.fromARGB(181, 196, 9, 221)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: currentScreen),
      ),
    );
  }
}

/*Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 200,
          color: const Color.fromARGB(150, 255, 255, 255),
        ),
        const SizedBox(
          height: 80,
        ),
        const Text(
          'Learn flutter the fun way',
          style: kLargeTextStyleLight,
        ),
        const SizedBox(
          height: 20,
        ),
        OutlinedButton.icon(
            style: OutlinedButton.styleFrom(backgroundColor: Colors.white),
            onPressed: startQuiz,
            label: const Text(
              'start',
              style: kMediumTextStyleDark,
            ),
            icon: const Icon(
              Icons.arrow_right_alt,
            )),
      ],
    );*/
