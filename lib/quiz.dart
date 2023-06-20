import 'package:flutter/material.dart';
import 'package:fquiz_app/questions.dart';
import 'package:fquiz_app/start_screen.dart';

// this is the class, where there will changes occurs in the child part of the container there will be changes will will occur on navgation
// this is like replacing the previous screen with new one.
// the startpage will be replaced with question screen.
// here we are having a variable activescreen whoch will be the one storiung currentlty presenting screen

/*this quiz widget will control the start page the quiz screeb widgets, this is called lifting up state so here we have a common class which will enable us to move backward and forward in this */
class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Widget? currentScreen;
  /*
  Here we are declaring this widget variable and then we are setting its current value to StartPage in the initState methos, this gets executed when the object opf the widget is formed
  so, there are no issues if we are referring to some things in the widget like switchScreen which is the part of this page and 
  setting it in the StartPage screen, so there fore to make sure the things are ready before we use them or the object is formed perfectly we use initState*/
  //*
  //If we do not need to use the initState here then we can just have some conditions like currentScreen is some variable or enum then this screen otherwise that screen */
  @override
  void initState() {
    // here the method which will change the screen is passed to another widget startpage so that we can execute this from onwe of the widgets
    currentScreen = StartPage(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      currentScreen = const Question();
    });
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
