import 'package:flutter/material.dart';
import 'package:fquiz_app/styles.dart';

class QuestionButtons extends StatelessWidget {
  const QuestionButtons({super.key, required this.answer, required this.onTap});
  final String answer;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 66, 4, 77),
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))),
      onPressed: onTap,
      child: Text(
        answer,
        style: kSmallTextStyleLight,
        textAlign: TextAlign.center,
      ),
    );
  }
}
