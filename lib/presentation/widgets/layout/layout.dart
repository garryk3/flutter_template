import 'package:flutter/material.dart';
import 'package:psychology_tests/infrastructure/router/router.dart';
import 'package:psychology_tests/presentation/widgets/buttons/buttons.dart';

import 'package:psychology_tests/presentation/widgets/typography/typography.dart';

class ScreenLayout extends StatelessWidget {
  const ScreenLayout({
    super.key,
    required this.child,
    required this.heading,
    this.hasBackBtn = false,
  });

  final Widget child;
  final String heading;
  final bool hasBackBtn;

  Widget _buildBackButton() {
    return AppBtn(
      text: 'вернуться назад',
      onPress: router.goBack,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        TypoHeading(text: heading),
        Expanded(
          child: child,
        ),
        if (hasBackBtn) _buildBackButton(),
      ],
    );
  }
}
