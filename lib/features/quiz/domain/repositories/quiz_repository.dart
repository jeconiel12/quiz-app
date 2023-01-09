import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../../topic/domain/models/topic_model.dart';
import '../models/question_model.dart';
import 'i_quiz_repository.dart';

class QuizRepository implements IQuizRepository {
  final FirebaseFirestore firestore;

  const QuizRepository({required this.firestore});

  @override
  Future<Either<Failure, List<QuestionModel>>> getQuestions(
      TopicModel topic) async {
    try {
      final snapshot = await firestore
          .collection('quizzes')
          .doc(topic.id)
          .collection('questions')
          .get();
      final questions = snapshot.docs.map(QuestionModel.fromDoc).toList();
      return right(questions);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
