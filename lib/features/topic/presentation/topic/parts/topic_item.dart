part of '../topic_page.dart';

class TopicItem extends StatelessWidget {
  final TopicModel topic;
  final VoidCallback onTap;

  const TopicItem({
    Key? key,
    required this.topic,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: QuizColor.blue,
      child: ListTile(
        onTap: onTap,
        title: Text(topic.name),
        trailing: const Icon(Icons.arrow_right),
      ),
    );
  }
}
