import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../../../core/core.dart';
import '../../../theme/quiz_color.dart';
import '../../../widgets/quiz_button.dart';
import '../../quiz/quiz.dart';
import '../../topic/topic.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(
                Icons.lightbulb,
                color: Colors.yellow,
                size: 80,
              ),
              const SizedBox(height: 24),
              Text(
                'Flutter Quiz App',
                style: context.textTheme.headline5!
                    .copyWith(fontWeight: FontWeight.w900),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Learn • Take Quiz • Repeat',
                style: context.textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 64),
              QuizElevatedButton(
                label: 'PLAY',
                onPressed: () => Navigator.pushNamed(
                  context,
                  QuizPage.routeName,
                ),
              ),
              const SizedBox(height: 16),
              QuizOutlinedButton(
                label: 'TOPICS',
                onPressed: () => Navigator.pushNamed(
                  context,
                  TopicPage.routeName,
                ),
              ),
              const SizedBox(height: 24),
              QuizTextButton(
                onPressed: () => Share.share(
                  'Download quiz app now!\nhttps://github.com/jeconiel12/quiz-app',
                ),
                leading: const Icon(
                  Icons.share,
                  color: QuizColor.lightBlue,
                ),
                label: 'Share',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
