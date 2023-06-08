import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:psychology_tests/presentation/widgets/layout/layout.dart';
import 'package:psychology_tests/presentation/widgets/typography/typography.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
      heading: 'sc__test__heading'.tr,
      child: Center(
        child: TypoText(text: 'sc__test__variants'.tr),
      ),
    );
  }
}
