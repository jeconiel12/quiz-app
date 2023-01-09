part of '../topic_page.dart';

class TopicList extends StatelessWidget {
  final List<TopicModel> topics;

  const TopicList({
    super.key,
    required this.topics,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: topics.length,
      itemBuilder: (context, index) => TopicItem(
        onTap: () => Navigator.pushNamed(
          context,
          QuizPage.routeName,
          arguments: topics[index],
        ),
        topic: topics[index],
      ),
    );
  }
}
