import 'package:equatable/equatable.dart';

class QuizHistoryModel extends Equatable {
  final String question;
  final String? selectedAnswer;
  final String correctAnswer;

  const QuizHistoryModel({
    required this.question,
    this.selectedAnswer,
    required this.correctAnswer,
  });

  @override
  List<Object?> get props => [question, selectedAnswer, correctAnswer];
}

extension ListQuizHistoryX on List<QuizHistoryModel> {
  int get correctScore =>
      where((history) => history.selectedAnswer == history.correctAnswer)
          .length;
}
