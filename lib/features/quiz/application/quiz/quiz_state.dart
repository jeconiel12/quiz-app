part of 'quiz_cubit.dart';

abstract class QuizState extends Equatable {
  const QuizState();
}

class QuizLoading extends QuizState {
  const QuizLoading();

  @override
  List<Object> get props => [];
}

class QuizLoaded extends QuizState {
  final List<QuestionModel> questions;

  const QuizLoaded(this.questions);

  @override
  List<Object> get props => [questions];
}

class QuizError extends QuizState {
  final Failure failure;

  const QuizError(this.failure);

  @override
  List<Object> get props => [failure];
}
