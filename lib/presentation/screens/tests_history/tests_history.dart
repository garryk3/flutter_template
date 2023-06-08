import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:psychology_tests/presentation/widgets/layout/layout.dart';
import 'package:psychology_tests/presentation/widgets/typography/typography.dart';

class TestsHistory extends StatelessWidget {
  const TestsHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
      heading: 'sc__test-history__heading'.tr,
      hasBackBtn: true,
      child: const Center(
        child: TypoText(text: 'описание тестирования'),
      ),
    );
  }
}
