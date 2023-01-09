import 'package:dartz/dartz.dart';

import '../../../../../core/core.dart';
import '../../../topic/domain/models/topic_model.dart';
import '../models/question_model.dart';

abstract class IQuizRepository {
  Future<Either<Failure, List<QuestionModel>>> getQuestions(TopicModel topic);
}
