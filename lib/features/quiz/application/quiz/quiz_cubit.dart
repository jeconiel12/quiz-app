import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../../topic/domain/models/topic_model.dart';
import '../../../topic/domain/repositories/i_topic_repository.dart';
import '../../domain/models/question_model.dart';
import '../../domain/repositories/i_quiz_repository.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  final IQuizRepository quizRepository;
  final ITopicRepository topicRepository;

  QuizCubit({
    required this.quizRepository,
    required this.topicRepository,
  }) : super(const QuizLoading());

  Future<void> getQuestions(TopicModel? topic) async {
    emit(const QuizLoading());

    // Get random topic
    if (topic == null) {
      final getTopicsResult = await topicRepository.getTopics();
      getTopicsResult.fold(
        (failure) {
          emit(QuizError(failure));
          return;
        },
        (topics) {
          final randomTopicIndex = Random().nextInt(topics.length);
          topic = topics[randomTopicIndex];
        },
      );
    }
    final result = await quizRepository.getQuestions(topic!);
    result.fold(
      (failure) => emit(QuizError(failure)),
      (questions) {
        emit(QuizLoaded(questions));
      },
    );
  }
}
