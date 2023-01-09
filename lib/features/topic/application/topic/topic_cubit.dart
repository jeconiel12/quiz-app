import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../domain/models/topic_model.dart';
import '../../domain/repositories/i_topic_repository.dart';

part 'topic_state.dart';

class TopicCubit extends Cubit<TopicState> {
  final ITopicRepository topicRepository;

  TopicCubit({
    required this.topicRepository,
  }) : super(const TopicLoading());

  Future<void> getTopics() async {
    emit(const TopicLoading());
    final result = await topicRepository.getTopics();
    result.fold(
      (failure) => emit(TopicError(failure)),
      (topics) => emit(TopicLoaded(topics)),
    );
  }
}
