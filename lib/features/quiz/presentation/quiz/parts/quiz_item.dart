part of '../quiz_page.dart';

class QuizItem extends StatelessWidget {
  final QuestionModel question;
  final String selectedOption;

  const QuizItem({
    Key? key,
    required this.question,
    required this.selectedOption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      question.question,
                      style: context.textTheme.bodyLarge!.copyWith(
                        color: Colors.black87,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    if (question.imageUrl.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Image.network(
                        question.imageUrl,
                        fit: BoxFit.fitWidth,
                      )
                    ],
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            for (var option in question.options)
              _QuizOptionItem(
                option: option,
                isSelected: option == selectedOption,
                isCorrect: question.answer == selectedOption,
                onPressed: selectedOption.isEmpty
                    ? () =>
                        context.read<QuizProgressCubit>().selectOption(option)
                    : null,
              )
          ],
        ),
      ),
    );
  }
}

class _QuizOptionItem extends StatelessWidget {
  const _QuizOptionItem({
    Key? key,
    required this.option,
    required this.onPressed,
    required this.isSelected,
    required this.isCorrect,
  }) : super(key: key);

  final String option;
  final VoidCallback? onPressed;
  final bool isSelected;
  final bool isCorrect;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: QuizElevatedButton(
        label: option,
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.white : null,
          foregroundColor: isSelected ? Colors.black87 : null,
        ),
        leading: isSelected
            ? Icon(
                isCorrect ? Icons.check : Icons.close,
                color: isCorrect ? QuizColor.green : QuizColor.red,
              )
            : null,
        onPressed: onPressed,
      ),
    );
  }
}
