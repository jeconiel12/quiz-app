part of '../quiz_page.dart';

class QuizList extends StatefulWidget {
  final List<QuestionModel> questions;

  const QuizList({
    super.key,
    required this.questions,
  });

  @override
  State<QuizList> createState() => _QuizListState();
}

class _QuizListState extends State<QuizList> {
  late PageController _pageController;

  @override
  initState() {
    super.initState();
    _pageController = PageController();
    context.read<QuizProgressCubit>().setQuestions(widget.questions);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<QuizProgressCubit, QuizProgressState>(
          listenWhen: (p, c) => p.histories != c.histories,
          listener: (context, state) {
            Timer(
              Duration(milliseconds: state.selectedOption.isNotEmpty ? 800 : 0),
              context.read<QuizProgressCubit>().nextQuestion,
            );
          },
        ),
        BlocListener<QuizProgressCubit, QuizProgressState>(
          listenWhen: (p, c) => p.activeQuestionIndex != c.activeQuestionIndex,
          listener: (context, state) {
            _pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
            );
          },
        ),
        BlocListener<QuizProgressCubit, QuizProgressState>(
          listenWhen: (p, c) => c.isCompleted,
          listener: (context, state) {
            Navigator.pushReplacementNamed(
              context,
              QuizResultPage.routeName,
              arguments: state.histories,
            );
          },
        ),
      ],
      child: Column(
        children: [
          BlocBuilder<QuizProgressCubit, QuizProgressState>(
            buildWhen: (p, c) => p.activeQuestionIndex != c.activeQuestionIndex,
            builder: (context, state) {
              // To active index given to trigger timer bar rebuild
              return QuizTimerBar(
                activeIndex: state.activeQuestionIndex,
                onFinished: context.read<QuizProgressCubit>().selectOption,
              );
            },
          ),
          const SizedBox(height: 8),
          BlocBuilder<QuizProgressCubit, QuizProgressState>(
            buildWhen: (p, c) => p.questions != c.questions,
            builder: (context, state) {
              return Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.questions.length,
                  itemBuilder: (context, index) {
                    return BlocBuilder<QuizProgressCubit, QuizProgressState>(
                      buildWhen: (p, c) => p.selectedOption != c.selectedOption,
                      builder: (context, state) {
                        return QuizItem(
                          question: state.questions[index],
                          selectedOption: state.selectedOption,
                        );
                      },
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
