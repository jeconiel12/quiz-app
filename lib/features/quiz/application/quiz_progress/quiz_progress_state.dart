part of 'quiz_progress_cubit.dart';

class QuizProgressState extends Equatable {
  final List<QuestionModel> questions;
  final List<QuizHistoryModel> histories;
  final int activeQuestionIndex;
  final String selectedOption;
  final bool isCompleted;

  const QuizProgressState({
    required this.questions,
    required this.histories,
    required this.activeQuestionIndex,
    required this.selectedOption,
    required this.isCompleted,
  });

  factory QuizProgressState.initial() {
    return const QuizProgressState(
      questions: [],
      histories: [],
      activeQuestionIndex: 0,
      selectedOption: '',
      isCompleted: false,
    );
  }

  QuizProgressState copyWith({
    List<QuestionModel>? questions,
    List<QuizHistoryModel>? histories,
    int? activeQuestionIndex,
    String? selectedOption,
    bool? isCompleted,
  }) {
    return QuizProgressState(
      questions: questions ?? this.questions,
      histories: histories ?? this.histories,
      activeQuestionIndex: activeQuestionIndex ?? this.activeQuestionIndex,
      selectedOption: selectedOption ?? this.selectedOption,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  bool get isLastQuestion => activeQuestionIndex >= (questions.length - 1);

  @override
  List<Object> get props => [
        questions,
        histories,
        activeQuestionIndex,
        selectedOption,
        isCompleted,
      ];
}
