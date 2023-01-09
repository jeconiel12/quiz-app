import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../../../theme/quiz_color.dart';
import '../../../../widgets/quiz_button.dart';
import '../../../../widgets/quiz_error_view.dart';
import '../../../topic/topic.dart';
import '../../application/quiz/quiz_cubit.dart';
import '../../application/quiz_progress/quiz_progress_cubit.dart';
import '../../domain/models/question_model.dart';
import '../../domain/repositories/quiz_repository.dart';
import '../quiz_result/quiz_result_page.dart';

part 'parts/quiz_item.dart';
part 'parts/quiz_list.dart';
part 'parts/quiz_time_bar.dart';

class QuizPage extends StatelessWidget {
  static const routeName = '/quiz';

  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    final firestore = FirebaseFirestore.instance;
    final topic = ModalRoute.of(context)?.settings.arguments as TopicModel?;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => QuizCubit(
            quizRepository: QuizRepository(firestore: firestore),
            topicRepository: TopicRepository(firestore: firestore),
          )..getQuestions(topic),
        ),
        BlocProvider(
          create: (context) => QuizProgressCubit(),
        ),
      ],
      child: const QuizView(),
    );
  }
}

class QuizView extends StatelessWidget {
  final TopicModel? topic;

  const QuizView({
    super.key,
    this.topic,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Page'),
      ),
      body: SafeArea(
        child: Center(
          child: BlocBuilder<QuizCubit, QuizState>(
            builder: (context, state) {
              if (state is QuizLoaded) {
                return QuizList(questions: state.questions);
              }
              if (state is QuizError) {
                return QuizErrorView(
                  failure: state.failure,
                  onPressed: () =>
                      context.read<QuizCubit>().getQuestions(topic),
                );
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
