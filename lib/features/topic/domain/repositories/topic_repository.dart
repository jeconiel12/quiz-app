import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../models/topic_model.dart';
import 'i_topic_repository.dart';

class TopicRepository implements ITopicRepository {
  final FirebaseFirestore firestore;

  const TopicRepository({required this.firestore});

  @override
  Future<Either<Failure, List<TopicModel>>> getTopics() async {
    try {
      final snapshot = await firestore.collection('quizzes').get();
      final topics = snapshot.docs.map(TopicModel.fromDoc).toList();
      return right(topics);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
