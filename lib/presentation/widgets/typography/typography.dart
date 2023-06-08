import 'package:flutter/material.dart';

class TypoText extends StatelessWidget {
  const TypoText({
    super.key,
    required this.text,
    this.color = Colors.black,
    this.fontSize = 16,
    this.fontWeight = FontWeight.normal,
  });

  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}

class TypoHeading extends StatelessWidget {
  const TypoHeading({
    super.key,
    required this.text,
    this.color = Colors.black,
  });

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return TypoText(
      text: text,
      color: color,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    );
  }
}
