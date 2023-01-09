import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../theme/quiz_color.dart';
import '../../../../widgets/quiz_error_view.dart';
import '../../../quiz/presentation/quiz/quiz_page.dart';
import '../../application/topic/topic_cubit.dart';
import '../../domain/models/topic_model.dart';
import '../../domain/repositories/topic_repository.dart';

part 'parts/topic_list.dart';
part 'parts/topic_item.dart';

class TopicPage extends StatelessWidget {
  static const routeName = '/topic';

  const TopicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TopicCubit(
        topicRepository: TopicRepository(
          firestore: FirebaseFirestore.instance,
        ),
      )..getTopics(),
      child: const TopicView(),
    );
  }
}

class TopicView extends StatelessWidget {
  const TopicView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Topics'),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 16,
            ),
            child: BlocBuilder<TopicCubit, TopicState>(
              builder: (context, state) {
                if (state is TopicLoaded) {
                  return TopicList(topics: state.topics);
                }
                if (state is TopicError) {
                  return QuizErrorView(
                    failure: state.failure,
                    onPressed: context.read<TopicCubit>().getTopics,
                  );
                }
                return const CircularProgressIndicator();
              },
            ),
          ),
        ),
      ),
    );
  }
}
