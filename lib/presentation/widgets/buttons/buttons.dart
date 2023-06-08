import 'package:flutter/material.dart';
import 'package:psychology_tests/presentation/widgets/typography/typography.dart';

enum ButtonVariants {
  small,
  medium,
  large,
}

class AppBtn extends StatelessWidget {
  const AppBtn({
    super.key,
    required this.text,
    required this.onPress,
    this.variant = ButtonVariants.medium,
  });

  final String text;
  final VoidCallback onPress;
  final ButtonVariants variant;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
        side: const BorderSide(
          color: Colors.blue,
          width: 2,
        ),
        minimumSize: const Size(150, 50),
        alignment: Alignment.center,
      ),
      child: TypoText(
        text: text,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
