import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'features/home/home.dart';
import 'features/quiz/quiz.dart';
import 'features/topic/topic.dart';
import 'firebase_options.dart';

import 'theme/quiz_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      theme: QuizTheme.dark,
      initialRoute: HomePage.routeName,
      routes: _routes,
    );
  }
}

final Map<String, WidgetBuilder> _routes = {
  HomePage.routeName: (_) => const HomePage(),
  QuizPage.routeName: (_) => const QuizPage(),
  TopicPage.routeName: (_) => const TopicPage(),
  QuizResultPage.routeName: (_) => const QuizResultPage(),
};
