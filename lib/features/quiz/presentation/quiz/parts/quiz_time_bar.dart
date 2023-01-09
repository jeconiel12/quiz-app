part of '../quiz_page.dart';

class QuizTimerBar extends StatefulWidget {
  final VoidCallback onFinished;
  final int activeIndex;

  const QuizTimerBar({
    Key? key,
    required this.activeIndex,
    required this.onFinished,
  }) : super(key: key);

  @override
  State<QuizTimerBar> createState() => _QuizTimerBarState();
}

class _QuizTimerBarState extends State<QuizTimerBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 30),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    _animationController.forward().whenComplete(widget.onFinished);
  }

  @override
  void didUpdateWidget(covariant QuizTimerBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.activeIndex != widget.activeIndex) {
      _animationController.reset();
      _animationController.forward().whenComplete(widget.onFinished);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 4,
      child: Stack(
        children: [
          Container(color: QuizColor.blue),
          AnimatedContainer(
            duration: Duration.zero,
            width: MediaQuery.of(context).size.width * _animation.value,
            color: QuizColor.yellow,
          ),
        ],
      ),
    );
  }
}
