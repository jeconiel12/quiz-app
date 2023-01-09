import 'package:flutter/material.dart';

import '../core/core.dart';
import 'quiz_button.dart';

class QuizErrorView extends StatelessWidget {
  final Failure failure;
  final String label;
  final VoidCallback onPressed;

  const QuizErrorView({
    Key? key,
    required this.failure,
    this.label = 'Try Again',
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          failure.toString(),
          style: context.textTheme.headline6,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        QuizElevatedButton(
          onPressed: onPressed,
          label: label,
        ),
      ],
    );
  }
}
