import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class QuestionModel extends Equatable {
  final String question;
  final String imageUrl;
  final List<String> options;
  final String answer;

  const QuestionModel({
    required this.question,
    required this.imageUrl,
    required this.options,
    required this.answer,
  });

  factory QuestionModel.fromDoc(
      QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data();

    return QuestionModel(
      question: data['question'],
      imageUrl: data['image_url'] ?? '',
      options: List<String>.from(data['options']),
      answer: data['answer'],
    );
  }

  @override
  List<Object?> get props => [question, imageUrl, options, answer];
}
