import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/models/question_model.dart';
import '../../domain/models/quiz_history_model.dart';

part 'quiz_progress_state.dart';

class QuizProgressCubit extends Cubit<QuizProgressState> {
  QuizProgressCubit() : super(QuizProgressState.initial());

  void setQuestions(List<QuestionModel> questions) {
    emit(
      state.copyWith(
        questions: questions,
        histories: [],
        activeQuestionIndex: 0,
      ),
    );
  }

  void selectOption([String? option]) {
    final updatedHistories = List<QuizHistoryModel>.from(state.histories);
    final activeQuestion = state.questions[state.activeQuestionIndex];

    updatedHistories.add(
      QuizHistoryModel(
        question: activeQuestion.question,
        selectedAnswer: option,
        correctAnswer: activeQuestion.answer,
      ),
    );

    emit(
      state.copyWith(
        histories: updatedHistories,
        selectedOption: option ?? '',
        isCompleted: state.isLastQuestion,
      ),
    );
  }

  void nextQuestion() {
    final nextQuestionIndex = state.activeQuestionIndex + 1;

    emit(
      state.copyWith(
        activeQuestionIndex: nextQuestionIndex,
        selectedOption: '',
      ),
    );
  }
}
