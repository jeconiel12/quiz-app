import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class TopicModel extends Equatable {
  final String id;
  final String name;

  const TopicModel({
    required this.id,
    required this.name,
  });

  factory TopicModel.fromDoc(QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data();

    return TopicModel(
      id: doc.id,
      name: data['name'],
    );
  }

  @override
  List<Object?> get props => [id, name];
}
