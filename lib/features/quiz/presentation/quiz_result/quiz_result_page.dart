import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:share_plus/share_plus.dart';

import '../../../../core/core.dart';
import '../../../../theme/quiz_color.dart';
import '../../../../widgets/quiz_button.dart';
import '../../domain/models/quiz_history_model.dart';

part 'parts/quiz_result_item.dart';

class QuizResultPage extends StatelessWidget {
  static const routeName = '/quiz-result';

  const QuizResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    final histories =
        ModalRoute.of(context)?.settings.arguments as List<QuizHistoryModel>;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Score'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 3,
                  child: QuizResultChart(
                    totalAnswer: histories.length,
                    totalCorrectAnswer: histories.correctScore,
                  ),
                ),
                const SizedBox(height: 24),
                QuizElevatedButton(
                  label: 'Share your report',
                  onPressed: () => Share.share(
                    'Got ${histories.correctScore} out of ${histories.length} correct, Download quiz app now!\nhttps://github.com/jeconiel12/quiz-app',
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Your Report',
                  style: context.textTheme.headline6!.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 16),
                for (var history in histories) ResultItem(quizHistory: history),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class QuizResultChart extends StatelessWidget {
  static const _radius = 5.0;
  static const _showTitle = false;

  final int totalAnswer;
  final int totalCorrectAnswer;

  const QuizResultChart({
    Key? key,
    required this.totalAnswer,
    required this.totalCorrectAnswer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Text('$totalCorrectAnswer / $totalAnswer'),
        PieChart(
          PieChartData(
            sectionsSpace: 0,
            sections: [
              PieChartSectionData(
                color: QuizColor.green,
                value: totalCorrectAnswer / totalAnswer,
                radius: _radius,
                showTitle: _showTitle,
              ),
              PieChartSectionData(
                color: QuizColor.red,
                value: (totalAnswer - totalCorrectAnswer) / totalAnswer,
                radius: _radius,
                showTitle: _showTitle,
              )
            ],
          ),
        ),
      ],
    );
  }
}
