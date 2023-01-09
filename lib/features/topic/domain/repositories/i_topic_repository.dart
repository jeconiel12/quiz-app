import 'package:dartz/dartz.dart';

import '../../../../../core/core.dart';
import '../models/topic_model.dart';

abstract class ITopicRepository {
  Future<Either<Failure, List<TopicModel>>> getTopics();
}
