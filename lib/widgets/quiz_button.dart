import 'package:flutter/material.dart';

class QuizElevatedButton extends StatelessWidget {
  final String label;
  final Widget? leading;
  final VoidCallback? onPressed;
  final ButtonStyle? style;

  const QuizElevatedButton({
    super.key,
    required this.label,
    this.leading,
    this.onPressed,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: style,
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (leading != null) ...[
            leading!,
            const SizedBox(width: 4),
          ],
          Flexible(child: Text(label)),
        ],
      ),
    );
  }
}

class QuizOutlinedButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;

  const QuizOutlinedButton({
    super.key,
    required this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Text(label),
    );
  }
}

class QuizTextButton extends StatelessWidget {
  final String label;
  final Widget? leading;
  final VoidCallback? onPressed;

  const QuizTextButton({
    super.key,
    required this.label,
    this.leading,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (leading != null) ...[
            leading!,
            const SizedBox(width: 4),
          ],
          Flexible(child: Text(label)),
        ],
      ),
    );
  }
}
