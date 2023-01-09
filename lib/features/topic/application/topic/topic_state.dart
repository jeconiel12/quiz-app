part of 'topic_cubit.dart';

abstract class TopicState extends Equatable {
  const TopicState();
}

class TopicLoading extends TopicState {
  const TopicLoading();

  @override
  List<Object> get props => [];
}

class TopicLoaded extends TopicState {
  final List<TopicModel> topics;

  const TopicLoaded(this.topics);

  @override
  List<Object> get props => [topics];
}

class TopicError extends TopicState {
  final Failure failure;

  const TopicError(this.failure);

  @override
  List<Object> get props => [failure];
}
