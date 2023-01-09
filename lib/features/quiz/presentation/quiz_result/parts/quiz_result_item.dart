part of '../quiz_result_page.dart';

class ResultItem extends StatelessWidget {
  final QuizHistoryModel quizHistory;

  const ResultItem({
    Key? key,
    required this.quizHistory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(quizHistory.question),
          Row(
            children: [
              if (quizHistory.selectedAnswer != quizHistory.correctAnswer) ...[
                const Icon(
                  Icons.close,
                  color: QuizColor.red,
                ),
                const SizedBox(width: 4),
                Text(quizHistory.selectedAnswer ?? 'No Answer Selected'),
                const SizedBox(width: 8),
              ],
              const Icon(
                Icons.check,
                color: QuizColor.green,
              ),
              const SizedBox(width: 4),
              Text(quizHistory.correctAnswer),
            ],
          ),
        ],
      ),
    );
  }
}
