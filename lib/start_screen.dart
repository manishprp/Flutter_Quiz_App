import 'package:flutter/material.dart';
import 'package:fquiz_app/styles.dart';

// So this is one screen with alll its ui and the stateless widget as there are no changes i this screen. this is the first screen
class StartPage extends StatelessWidget {
  const StartPage(this.startQuiz, {super.key});
  final void Function() startQuiz;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
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
      ),
    );
  }
}
